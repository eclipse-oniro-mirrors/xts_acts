/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Hypium,
  Size,
  TestType
} from '../../../../hypium';
import { camera } from '@kit.CameraKit';
import { getPermission } from '../Common.test';
import { BusinessError } from '@kit.BasicServicesKit';
import { Context } from '@kit.ArkUI';
import Utils from '../Util.test';
import fs from '@ohos.file.fs';
import { colorSpaceManager } from '@kit.ArkGraphics2D';

const TAG = "CameraXtsPhotoOutputStaticTest";
let mCameraManager: camera.CameraManager | undefined;
let mCameraDeviceArray: Array<camera.CameraDevice> | undefined;
let mSupportedModes: Array<camera.SceneMode> | undefined;
let mCameraInput: camera.CameraInput | undefined;
let mPreviewOutput: camera.PreviewOutput | undefined;
let mPreviewProfile: camera.Profile | undefined;
let mPhotoOutput: camera.PhotoOutput | undefined;
let mPhotoSession: camera.PhotoSession | undefined;
let fdNumber: int | undefined;
let testContext: Context;
let indexSurfaceId: string = "";

let isEmptyCameraManager = (data: camera.CameraManager | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyCameraDevice = (data: camera.CameraDevice[] | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}
let isEmptyCameraInput = (data: camera.CameraInput | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let getCameraManagerInstance = () => {
  console.info('Enter getCameraManagerInstance');
  testContext = Hypium.get("Context") as Context;
  indexSurfaceId = Hypium.get('SurfaceId') as string;
  mCameraManager = camera.getCameraManager(testContext);
  if (isEmptyCameraManager(mCameraManager!)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');

  return true;
}

function getCameraInput(): boolean {
  console.info(TAG, 'getCameraInput.');
  if (mCameraDeviceArray!.length) {
    mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
    mCameraInput!.open();
    if (isEmptyCameraInput(mCameraInput!)) {
      return false;
    }
    return true;
  }
  console.info(TAG, 'cameraInput created successfully.');
  return false;
}

function getSupportedCameraDeviceArray(): boolean {
  console.info(TAG, 'getSupportedCameraDeviceArray.');
  mCameraDeviceArray = mCameraManager!.getSupportedCameras();
  if (isEmptyCameraDevice(mCameraDeviceArray!)) {
    return false;
  }
  console.info(TAG, 'getSupportedCameraDeviceArray length: ' + mCameraDeviceArray!.length);
  return true;
}

let indexZero: int = 0;
let indexOne: int = 1;
let defaultSize: int = 2;

function createPhotoOutput() {
  let useDevice: camera.CameraDevice = mCameraDeviceArray![0];
  let haveValidDevice = false;
  for (const device of mCameraDeviceArray!) {
    mSupportedModes = mCameraManager!.getSupportedSceneModes(device);
    if (mSupportedModes!.includes(camera.SceneMode.NORMAL_PHOTO)) {
      useDevice = device;
      haveValidDevice = true;
      break;
    }
  }
  if (!haveValidDevice) {
    return;
  }
  let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(useDevice, camera.SceneMode.NORMAL_PHOTO);
  mPreviewProfile = cameraOutputCap.previewProfiles[0];
  let previewProfile = cameraOutputCap.previewProfiles[0];
  let photoProfile = cameraOutputCap.photoProfiles[0];
  for (const indexPreviewProfiles of cameraOutputCap.previewProfiles!) {
    let foundProfile = cameraOutputCap.photoProfiles.find((indexPhotoProfile: camera.Profile) => {
      console.log(TAG, 'find photoProfile: w: ' + indexPhotoProfile.size.width + 'h: ' + indexPhotoProfile.size.height);
      console.log(TAG,
        'find previewProfile: w: ' + indexPreviewProfiles.size.width + 'h: ' + indexPreviewProfiles.size.height);
      return Math.abs((indexPhotoProfile.size.width * indexPreviewProfiles.size.height) -
        (indexPreviewProfiles.size.width * indexPhotoProfile.size.height)) < Number.EPSILON;
    })
    if (foundProfile) {
      photoProfile = foundProfile;
      previewProfile = indexPreviewProfiles;
      break;
    }
  }
  console.log(TAG, 'photoProfile: w: ' + photoProfile.size.width + 'h: ' + photoProfile.size.height);
  console.log(TAG, 'previewProfile: w: ' + previewProfile.size.width + 'h: ' + previewProfile.size.height);
  mPreviewOutput = mCameraManager!.createPreviewOutput(previewProfile, indexSurfaceId!);
  mPhotoOutput = mCameraManager!.createPhotoOutput(photoProfile);
}

async function getCreatePhotoSession(previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput) {
  console.info(TAG, 'getCreatePhotoSession.');
  mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
  mPhotoSession!.beginConfig();
  mPhotoSession!.addInput(mCameraInput!);
  await mCameraInput!.open();
  mPhotoSession!.addOutput(previewOutput);
  mPhotoSession!.addOutput(photoOutput);
  await mPhotoSession!.commitConfig();
}


async function releasePhotoSession() {
  console.info(TAG, 'releasePhotoSession.');
  await mPreviewOutput!.release();
  await mPhotoOutput!.release();
  await mPhotoSession!.release();
}

let isEmptyColorSpace = (data: colorSpaceManager.ColorSpace[]) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmptyArrayNumber = (data: Array<number>) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmptyBoolean = (data: boolean) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmptySmoothZoomInfo = (data: camera.SmoothZoomInfo) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmptyNumber = (data: number) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmptyFocusState = (data: camera.FocusState) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}


const CameraPreconfigPhoto = async (done: () => void, testName: string, callback: () => void) => {
  if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
    console.info(TAG, testName, ' mCameraDeviceArray is null.');
    return;
  } else {
    createPhotoOutput();
    await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
    callback();
    await releasePhotoSession();
    done();
  }
};

export default function PhotoOutputStaticTest(): void {
  describe('PhotoOutputStaticTest', () => {
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      getCameraManagerInstance();
      getSupportedCameraDeviceArray();
      getCameraInput();
    });

    beforeEach(() => {
      console.info('afterEach case');
    });

    afterEach(async () => {
      console.info('afterEach case');
      await Utils.msSleep(500);
    });

    afterAll(async () => {
      console.info('afterAll case');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ON_FOCUS_STATE_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ON_FOCUS_STATE_CHANGE_STATIC_0100
     * @tc.desc   onFocusStateChange api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ON_FOCUS_STATE_CHANGE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ON_FOCUS_STATE_CHANGE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            mPhotoSession!.onFocusStateChange((error: BusinessError | null,
              autoDeviceSwitchStatus: camera.FocusState | undefined) => {
              if (error !== undefined && error!.code !== 0) {
                expect().assertFail();
                return;
              }
              console.info(TAG, testName, "Entering start PASSED", autoDeviceSwitchStatus!);
              expect(isEmptyFocusState(autoDeviceSwitchStatus!)).assertFalse();
            })
            mPhotoSession!.offFocusStateChange();
            console.info(TAG, testName, "Entering start PASSED");
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_SYSTEM_PRESSURE_LEVEL_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_SYSTEM_PRESSURE_LEVEL_CHANGE_STATIC_0100
     * @tc.desc   onSystemPressureLevelChange success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_SYSTEM_PRESSURE_LEVEL_CHANGE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ON_SYSTEM_PRESSURE_LEVEL_CHANGE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            mPhotoSession!.onSystemPressureLevelChange((error: BusinessError | null,
              pressureState: camera.SystemPressureLevel | undefined) => {
              if (error !== undefined && error!.code !== 0) {
                expect().assertFail();
                done();
              } else {
                expect(pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_NORMAL ||
                  pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_MILD ||
                  pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_SEVERE ||
                  pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_CRITICAL ||
                  pressureState == camera.SystemPressureLevel.SYSTEM_PRESSURE_SHUTDOWN
                ).assertTrue();
              }
            })
            mPhotoSession!.offSystemPressureLevelChange();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
            mPhotoSession!.offSystemPressureLevelChange();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OPEN_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_OPEN_STATIC_0200
     * @tc.desc   OPEN the first parameter is CAMERA_FULL_CAPABILITY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OPEN_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_OPEN_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            if (mCameraDeviceArray! == undefined) {
              console.info(TAG + "Entering createInputs FAILED with NoCamera");
              return;
            }
            mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
            if (mCameraInput == undefined) {
              console.info(TAG, testName, "createCameraInput FAILED");
              return;
            }
            let count = 0;
            if (mCameraManager!.getCameraConcurrentInfos(mCameraDeviceArray!!).length > 0) {
              mCameraInput!.onError(mCameraDeviceArray![0], (err: BusinessError) => {
                console.error(TAG, testName, `Camera input error code: ${err.code}`);
                count = 1;
              })
              console.info(TAG, testName, "Entering  start");
              await mCameraInput!.open(camera.CameraConcurrentType.CAMERA_FULL_CAPABILITY);
              expect(count).assertEqual(0);
            } else {
              console.info(TAG, testName, `Camera input 不支持`);
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code, err);
            expect().assertFail();
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_ACTIVE_COLOR_SPACE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_ACTIVE_COLOR_SPACE_STATIC_0100
     * @tc.desc   getActiveColorSpace AND setColorSpace success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_ACTIVE_COLOR_SPACE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_ACTIVE_COLOR_SPACE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          const colorSpaces = [
            colorSpaceManager.ColorSpace.ADOBE_RGB_1998,
            colorSpaceManager.ColorSpace.DCI_P3,
            colorSpaceManager.ColorSpace.SRGB,
            colorSpaceManager.ColorSpace.BT709,
            colorSpaceManager.ColorSpace.BT601_EBU,
            colorSpaceManager.ColorSpace.BT601_SMPTE_C,
            colorSpaceManager.ColorSpace.BT2020_HLG,
            colorSpaceManager.ColorSpace.BT2020_PQ,
            colorSpaceManager.ColorSpace.P3_HLG,
            colorSpaceManager.ColorSpace.P3_PQ,
            colorSpaceManager.ColorSpace.ADOBE_RGB_1998_LIMIT,
            colorSpaceManager.ColorSpace.DISPLAY_P3_LIMIT,
            colorSpaceManager.ColorSpace.SRGB_LIMIT,
            colorSpaceManager.ColorSpace.BT601_EBU_LIMIT,
            colorSpaceManager.ColorSpace.BT601_SMPTE_C_LIMIT,
            colorSpaceManager.ColorSpace.BT2020_HLG_LIMIT,
            colorSpaceManager.ColorSpace.BT2020_PQ_LIMIT,
            colorSpaceManager.ColorSpace.P3_HLG_LIMIT,
            colorSpaceManager.ColorSpace.P3_PQ_LIMIT,
            colorSpaceManager.ColorSpace.LINEAR_P3,
            colorSpaceManager.ColorSpace.LINEAR_SRGB,
            colorSpaceManager.ColorSpace.LINEAR_BT709,
            colorSpaceManager.ColorSpace.LINEAR_BT2020,
            colorSpaceManager.ColorSpace.DISPLAY_SRGB,
            colorSpaceManager.ColorSpace.DISPLAY_P3_HLG,
            colorSpaceManager.ColorSpace.DISPLAY_P3_PQ,
            colorSpaceManager.ColorSpace.H_LOG,
            colorSpaceManager.ColorSpace.DISPLAY_BT2020_SRGB,
            colorSpaceManager.ColorSpace.CUSTOM
          ];
          const colorSpaceMap = (space: colorSpaceManager.ColorSpace): boolean => {
            console.info(TAG, testName, 'colorSpaceMap', space, mPreviewProfile);
            if (space === colorSpaceManager.ColorSpace.SRGB || space === colorSpaceManager.ColorSpace.DISPLAY_P3) {
              return mPreviewProfile!.format === camera.CameraFormat.CAMERA_FORMAT_YUV_420_SP;
            }
            if (space === colorSpaceManager.ColorSpace.BT2020_HLG) {
              return mPreviewProfile!.format === camera.CameraFormat.CAMERA_FORMAT_YCRCB_P010 ||
                mPreviewProfile!.format === camera.CameraFormat.CAMERA_FORMAT_YCBCR_P010;
            }
            return false
          }
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          for (const space of colorSpaces) {
            console.info(TAG, testName, 'currentSpace', space,);
            try {
              let suppColorSpaces: Array<colorSpaceManager.ColorSpace> = mPhotoSession!.getSupportedColorSpaces();
              console.info(TAG, testName, suppColorSpaces, `json is`, JSON.stringify(suppColorSpaces));
              const isSupported = suppColorSpaces.includes(space);
              if (isSupported && colorSpaceMap(space)) {
                console.info(TAG, testName, 'set is ', space);
                mPhotoSession!.setColorSpace(space);
                console.info(TAG, testName, 'get is', mPhotoSession!.getActiveColorSpace());
                expect(mPhotoSession!.getActiveColorSpace()).assertEqual(space);
                console.info(TAG, testName, `setColorSpace success`);
              } else {
                console.info(TAG, testName, ` 当前设备不支持${space}色彩空间`);
              }
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code, err);
              expect().assertFail();
            }
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_COLOR_SPACES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_COLOR_SPACES_STATIC_0100
     * @tc.desc   getSupportedColorSpaces success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_COLOR_SPACES_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_COLOR_SPACES_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let res = mPhotoSession!.getSupportedColorSpaces();
            expect(isEmptyColorSpace(res)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0100
     * @tc.desc   enableMacro parameter is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            if (mPhotoSession!.isMacroSupported()) {
              mPhotoSession!.enableMacro(true);
            } else {
              console.info(TAG, testName, " 当前设备不支持");
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0200
     * @tc.desc   enableMacro parameter is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            if (mPhotoSession!.isMacroSupported()) {
              mPhotoSession!.enableMacro(false);
            } else {
              console.info(TAG, testName, " 当前设备不支持");
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0300
     * @tc.desc   enableMacro parameter is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0300';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            if (!mPhotoSession!.isMacroSupported()) {
              mPhotoSession!.enableMacro(true);
              expect().assertFail();
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0400
     * @tc.desc   enableMacro parameter is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLE_MACRO_STATIC_0400';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            if (!mPhotoSession!.isMacroSupported()) {
              mPhotoSession!.enableMacro(false);
              expect().assertFail();
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_SMOOTH_ZOOM_INFO_AVAILABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_SMOOTH_ZOOM_INFO_AVAILABLE_STATIC_0100
     * @tc.desc   onSmoothZoomInfoAvailable success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_SMOOTH_ZOOM_INFO_AVAILABLE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ON_SMOOTH_ZOOM_INFO_AVAILABLE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let supportedZoomRatioRange: Array<number> = mPhotoSession!.getZoomRatioRange();
            console.info(TAG + testName + " supportedZoomRatioRange.length: " +
            supportedZoomRatioRange.length);
            let callbackFlag: boolean = false;
            if (supportedZoomRatioRange.length == defaultSize) {
              mPhotoSession!.onSmoothZoomInfoAvailable(
                (err: BusinessError | null, smoothZoomInfo: camera.SmoothZoomInfo | undefined): void => {
                  if (!err || err.code == 0) {
                    console.info(TAG + testName + "Entering on smoothZoomInfoAvailable success");
                    callbackFlag = true;
                    expect(isEmptyNumber(smoothZoomInfo!.duration)).assertFalse();
                    mPhotoSession!.offSmoothZoomInfoAvailable();
                    done();
                  } else {
                    console.info(TAG + testName + "Error in FAILED on smoothZoomInfoAvailable: " +
                    err.message);
                    expect().assertFail();
                    done();
                  }
                })
              if (mPhotoSession!.isAutoDeviceSwitchSupported()) {
                mPhotoSession!.setZoomRatio((supportedZoomRatioRange[indexZero] + 0.1) as number);
                await Utils.msSleep(1000);
                console.info(TAG + testName + "Entering setZoomRatio: " + (supportedZoomRatioRange[indexZero] + 0.1));
                mPhotoSession!.setSmoothZoom((supportedZoomRatioRange[indexOne] - 0.1) as number,
                  camera.SmoothZoomMode.NORMAL);
                console.info(TAG + testName + "Entering  targetZoomRatio: " +
                  (supportedZoomRatioRange[indexOne] - 0.1));
                await Utils.msSleep(2000);
                let zoomRatio: number = mPhotoSession!.getZoomRatio();
                if ((zoomRatio - (supportedZoomRatioRange[indexOne] - 0.1)) < 0.01) {
                  console.info(TAG + testName + "Entering  PASSED with ZoomRatio is: " + zoomRatio);
                } else {
                  console.info(TAG + testName + "Entering  FAILED with ZoomRatio is: " + zoomRatio);
                  expect().assertFail();
                }
              }
            }
            let callbackTimeOut: int = 0;
            while (!callbackFlag && callbackTimeOut < 5000) {
              await Utils.msSleep(1000);
              callbackTimeOut += 1000;
              console.info(TAG + "Waiting for smoothZoomInfoAvailable callback, timeout:10000, now time: " +
                callbackTimeOut);
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          } finally {
            await releasePhotoSession();
            done();
          }
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0100
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0100';
      if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
        return;
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
        try {
          let result = mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0200
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0200';
      if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
        return;
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
        }
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0300
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0300';
      if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
        console.info(TAG, testName, ' mCameraDeviceArray is null.');
        return;
      } else {
        createPhotoOutput();
        await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
        try {
          let result = mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
            camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
        await releasePhotoSession();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0400
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0400';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
              camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0500
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0500';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
            camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0600
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0600';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_1080P,
              camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0700
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0700';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
              camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0800
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0800';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
              camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0900
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_STATIC_0900';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_720P,
              camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0100
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0100';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0200
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0200';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0300
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0300';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result =
            mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_4K, camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0400
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0400';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_4_3);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0500
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0500';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_16_9);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0600
     * @tc.desc   Create photo session Preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CREATE_SESSION_PRECONFIG_CAN_STATIC_0600';
      CameraPreconfigPhoto(done, testName, () => {
        try {
          let result = mPhotoSession!.canPreconfig(camera.PreconfigType.PRECONFIG_HIGH_QUALITY,
            camera.PreconfigRatio.PRECONFIG_RATIO_1_1);
          console.info(TAG, testName, `canPreconfig result is : ${result}`);
          expect(isEmptyBoolean(result)).assertFalse();
          done();
        } catch (error) {
          console.info(TAG, testName, error.message, error.code);
          expect().assertFail();
          done();
        }
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ON_MACRO_STATUS_CHANGED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ON_MACRO_STATUS_CHANGED_STATIC_0100
     * @tc.desc   onMacroStatusChanged api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ON_MACRO_STATUS_CHANGED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ON_MACRO_STATUS_CHANGED_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            mPhotoSession!.onMacroStatusChanged((error: BusinessError | null,
              autoDeviceSwitchStatus: boolean | undefined) => {
              if (error !== undefined && error!.code !== 0) {
                expect().assertFail();
                return;
              } else {
                expect(isEmptyBoolean(autoDeviceSwitchStatus!)).assertFalse();
                console.info(TAG, testName, `onMacroStatusChanged is : `, autoDeviceSwitchStatus);
              }
            })
            mPhotoSession!.offMacroStatusChanged();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_MODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_MODE_STATIC_0100
     * @tc.desc   setExposureMode api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_MODE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_MODE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          const formats = [
            camera.ExposureMode.EXPOSURE_MODE_LOCKED,
            camera.ExposureMode.EXPOSURE_MODE_AUTO,
            camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO,
            camera.ExposureMode.EXPOSURE_MODE_MANUAL,
          ];
          for (const format of formats) {
            try {
              createPhotoOutput();
              await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
              if (mPhotoSession!.isExposureModeSupported(format)) {
                mPhotoSession!.setExposureMode(format);
                let result = mPhotoSession!.getExposureMode();
                console.info(TAG, testName, "Entering start PASSED", result);
                expect(result).assertEqual(format);
              }
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code);
              expect().assertFail();
            }
          }
          done();
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_MODE_STATIC_0200
     * @tc.desc   setExposureMode api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_MODE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.setExposureMode(camera.ExposureMode.EXPOSURE_MODE_AUTO);
            console.info(TAG, testName, "Entering start PASSED");
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_MODE_STATIC_0200
     * @tc.desc   getExposureMode api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_MODE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.getExposureMode();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_BIAS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_BIAS_STATIC_0100
     * @tc.desc   setExposureBias api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_BIAS_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_BIAS_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let res = mPhotoSession!.getExposureBiasRange();
            if (res.length > 0) {
              mPhotoSession!.setExposureBias(res[0]);
              let result = mPhotoSession!.getExposureValue();
              console.info(TAG, testName, "Entering start PASSED", result);
              expect(result).assertEqual(res[0]);
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_BIAS_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_BIAS_STATIC_0200
     * @tc.desc   setExposureBias api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_BIAS_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_EXPOSURE_BIAS_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.setExposureBias(1.0);
            console.info(TAG, testName, "Entering start PASSED");
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_VALUE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_VALUE_STATIC_0200
     * @tc.desc   getExposureValue api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_VALUE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_VALUE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.getExposureValue();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_METERING_POINT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_METERING_POINT_STATIC_0100
     * @tc.desc   setMeteringPoint api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_METERING_POINT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_METERING_POINT_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            mPhotoSession!.setMeteringPoint({ x: 1, y: 1 });
            let result = mPhotoSession!.getMeteringPoint();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect(result.x).assertEqual(1);
            expect(result.y).assertEqual(1);
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_METERING_POINT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_METERING_POINT_STATIC_0200
     * @tc.desc   setMeteringPoint api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_METERING_POINT_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_METERING_POINT_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.setMeteringPoint({ x: 1, y: 1 });
            console.info(TAG, testName, "Entering start PASSED");
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_METERING_POINT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_METERING_POINT_STATIC_0200
     * @tc.desc   getMeteringPoint api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_METERING_POINT_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_METERING_POINT_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.getMeteringPoint();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ON_AUTO_DEVICE_SWITCH_STATUS_CHANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ON_AUTO_DEVICE_SWITCH_STATUS_CHANGE_STATIC_0200
     * @tc.desc   isDeviceSwitched AND isDeviceCapabilityChanged api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ON_AUTO_DEVICE_SWITCH_STATUS_CHANGE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ON_AUTO_DEVICE_SWITCH_STATUS_CHANGE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let isBool = false;
            mPhotoSession!.onAutoDeviceSwitchStatusChange((error: BusinessError | null,
              autoDeviceSwitchStatus: camera.AutoDeviceSwitchStatus | undefined) => {
              if (error !== undefined && error!.code !== 0) {
                expect().assertFail();
                return;
              }
              expect(isEmptyBoolean(autoDeviceSwitchStatus!.isDeviceSwitched)).assertFalse();
              expect(isEmptyBoolean(autoDeviceSwitchStatus!.isDeviceCapabilityChanged)).assertFalse();
              isBool = true;
            })
            if (mPhotoSession!.isAutoDeviceSwitchSupported()) {
              mPhotoSession!.enableAutoDeviceSwitch(true);
              await Utils.msSleep(2000);
              mPhotoSession!.offAutoDeviceSwitchStatusChange();
              expect(isBool).assertTrue();
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
            mPhotoSession!.offAutoDeviceSwitchStatusChange();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_STATIC_0100
     * @tc.desc   getZoomRatioRange api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let result = mPhotoSession!.getZoomRatioRange();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect(isEmptyArrayNumber(result)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_STATIC_0200
     * @tc.desc   getZoomRatioRange api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.getZoomRatioRange();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_STATIC_0200
     * @tc.desc   getZoomRatio api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.getZoomRatio();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_ZOOM_RATIO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_ZOOM_RATIO_STATIC_0200
     * @tc.desc   setZoomRatio api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_ZOOM_RATIO_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_ZOOM_RATIO_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.setZoomRatio(1);
            console.info(TAG, testName, "Entering start PASSED");
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTO_SESSION_CAN_ADD_INPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTO_SESSION_CAN_ADD_INPUT_STATIC_0100
     * @tc.desc   PhotoSession canAddInput api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTO_SESSION_CAN_ADD_INPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PHOTO_SESSION_CAN_ADD_INPUT_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await Utils.msSleep(1000);
            mPhotoSession!.beginConfig();
            let res = mPhotoSession!.canAddInput(mCameraInput!);
            console.info(TAG, testName, "Entering start PASSED");
            expect(isEmptyBoolean(res)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          done();
        }
      })


    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTO_SESSION_ADD_INPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTO_SESSION_ADD_INPUT_STATIC_0100
     * @tc.desc   PhotoSession addInput api 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTO_SESSION_ADD_INPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PHOTO_SESSION_ADD_INPUT_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            await Utils.msSleep(1000);
            mPhotoSession!.addInput(mCameraInput!);
            mPhotoSession!.beginConfig();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTO_SESSION_REMOVE_INPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTO_SESSION_REMOVE_INPUT_STATIC_0100
     * @tc.desc   PhotoSession removeInput api 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTO_SESSION_REMOVE_INPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PHOTO_SESSION_REMOVE_INPUT_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            await Utils.msSleep(1000);
            mPhotoSession!.removeInput(mCameraInput!);
            mPhotoSession!.beginConfig();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_CAN_ADD_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_CAN_ADD_OUTPUT_STATIC_0100
     * @tc.desc   PhotoSession canaddOutput api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_CAN_ADD_OUTPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_CAN_ADD_OUTPUT_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await Utils.msSleep(1000);
            mPhotoSession!.beginConfig();
            let res = mPhotoSession!.canAddOutput(mPhotoOutput!);
            console.info(TAG, testName, "Entering start PASSED");
            expect(isEmptyBoolean(res)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTO_SESSION_ADD_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTO_SESSION_ADD_OUTPUT_STATIC_0100
     * @tc.desc   PhotoSession addOutput api 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTO_SESSION_ADD_OUTPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PHOTO_SESSION_ADD_OUTPUT_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            await Utils.msSleep(1000);
            mPhotoSession!.addOutput(mPhotoOutput!);
            mPhotoSession!.beginConfig();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_PHOTO_SESSION_REMOVE_OUTPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_PHOTO_SESSION_REMOVE_OUTPUT_STATIC_0100
     * @tc.desc   PhotoSession removeOutput api 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PHOTO_SESSION_REMOVE_OUTPUT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_PHOTO_SESSION_REMOVE_OUTPUT_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            await Utils.msSleep(1000);
            mPhotoSession!.removeOutput(mPhotoOutput!);
            mPhotoSession!.beginConfig();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_START_STATIC_0100
     * @tc.desc   PhotoSession start api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_START_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_PHOTO_SESSION_START_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            await mPhotoSession!.start();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_STATIC_0100
     * @tc.desc   hasFlash api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let result = mPhotoSession!.hasFlash();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect(isEmptyBoolean(result)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_STATIC_0200
     * @tc.desc   hasFlash api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.hasFlash();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORTED_STATIC_0100
     * @tc.desc   isFlashModeSupported api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORTED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORTED_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          const formats = [
            camera.FlashMode.FLASH_MODE_CLOSE,
            camera.FlashMode.FLASH_MODE_OPEN,
            camera.FlashMode.FLASH_MODE_AUTO,
            camera.FlashMode.FLASH_MODE_ALWAYS_OPEN,
          ];

          for (const format of formats) {
            try {
              createPhotoOutput();
              await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
              let result = mPhotoSession!.isFlashModeSupported(format);
              console.info(TAG, testName, "Entering start PASSED", result);
              expect(isEmptyBoolean(result)).assertFalse();
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code);
              expect().assertFail();
            }
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORTED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORTED_STATIC_0200
     * @tc.desc   isFlashModeSupported api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORTED_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORTED_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.isFlashModeSupported(camera.FlashMode.FLASH_MODE_AUTO);
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_FLASH_MODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_FLASH_MODE_STATIC_0100
     * @tc.desc   getFlashMode api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FLASH_MODE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_FLASH_MODE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          const formats = [
            camera.FlashMode.FLASH_MODE_CLOSE,
            camera.FlashMode.FLASH_MODE_OPEN,
            camera.FlashMode.FLASH_MODE_AUTO,
            camera.FlashMode.FLASH_MODE_ALWAYS_OPEN,
          ];

          for (const format of formats) {
            try {
              createPhotoOutput();
              await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
              if (mPhotoSession!.hasFlash()) {
                if (mPhotoSession!.isFlashModeSupported(format)) {
                  mPhotoSession!.setFlashMode(format);
                  let mode = mPhotoSession!.getFlashMode();
                  console.info(TAG, testName, ' photo set flash mode, status: ', format, mode);
                  expect(mode).assertEqual(format);
                } else {
                  console.error(TAG, testName, "Flash mode not supported on this device");
                }
              }
              console.info(TAG, testName, "Entering start PASSED");
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code);
              expect().assertFail();
            }
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_FLASH_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_FLASH_MODE_STATIC_0200
     * @tc.desc   getFlashMode api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FLASH_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_FLASH_MODE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.getFlashMode();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_FLASH_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_FLASH_MODE_STATIC_0200
     * @tc.desc   setFlashMode api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_FLASH_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_FLASH_MODE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.setFlashMode(camera.FlashMode.FLASH_MODE_CLOSE);
            console.info(TAG, testName, "Entering start PASSED");
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORTED_STATIC_0100
     * @tc.desc   isFocusModeSupported api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORTED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORTED_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          const formats = [
            camera.FocusMode.FOCUS_MODE_MANUAL,
            camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO,
            camera.FocusMode.FOCUS_MODE_AUTO,
            camera.FocusMode.FOCUS_MODE_LOCKED,
          ];

          for (const format of formats) {
            try {
              createPhotoOutput();
              await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
              let result = mPhotoSession!.isFocusModeSupported(format);
              console.info(TAG, testName, "Entering start PASSED", result);
              expect(isEmptyBoolean(result)).assertFalse();
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code);
              expect().assertFail();
            }
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORTED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORTED_STATIC_0200
     * @tc.desc   isFocusModeSupported api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORTED_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORTED_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.isFocusModeSupported(camera.FocusMode.FOCUS_MODE_AUTO);
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_MODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_MODE_STATIC_0100
     * @tc.desc   getFocusMode api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_MODE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_MODE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          const formats = [
            camera.FocusMode.FOCUS_MODE_MANUAL,
            camera.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO,
            camera.FocusMode.FOCUS_MODE_AUTO,
            camera.FocusMode.FOCUS_MODE_LOCKED,
          ];

          for (const format of formats) {
            try {
              createPhotoOutput();
              await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
              if (mPhotoSession!.isFocusModeSupported(format)) {
                mPhotoSession!.setFocusMode(format);
                let mode = mPhotoSession!.getFocusMode();
                console.info(TAG, testName, ' photo set flash mode, status: ', format, mode);
                expect(mode).assertEqual(format);
              } else {
                console.error(TAG, testName, "Flash mode not supported on this device");
              }
              console.info(TAG, testName, "Entering start PASSED");
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code);
              expect().assertFail();
            }
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_MODE_STATIC_0200
     * @tc.desc   getFocusMode api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_MODE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let mode = mPhotoSession!.getFocusMode();
            console.info(TAG, testName, ' photo set flash mode, status: ', mode);
            expect().assertFail();
            console.info(TAG, testName, "Entering start PASSED");
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_MODE_STATIC_0200
     * @tc.desc   setFocusMode api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_MODE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_MODE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.setFocusMode(camera.FocusMode.FOCUS_MODE_AUTO);
            console.info(TAG, testName, ' photo set flash mode, status: ');
            expect().assertFail();
            console.info(TAG, testName, "Entering start PASSED");
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_POINT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_POINT_STATIC_0100
     * @tc.desc   setFocusPoint api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_POINT_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_POINT_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            mPhotoSession!.setFocusPoint({ x: 1, y: 1 });
            let mode = mPhotoSession!.getFocusPoint();
            expect(mode.x).assertEqual(1);
            expect(mode.y).assertEqual(1);
            console.info(TAG, testName, "Entering start PASSED");
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_POINT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_POINT_STATIC_0200
     * @tc.desc   setFocusPoint api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_POINT_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_FOCUS_POINT_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.setFocusPoint({ x: 1, y: 1 });
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_POINT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_POINT_STATIC_0200
     * @tc.desc   getFocusPoint api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_POINT_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCUS_POINT_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.getFocusMode();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_STATIC_0200
     * @tc.desc   getFocusPoint api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.getFocalLength();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_IS_PHYSICAL_CAMERA_ORIENTATION_VARIABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_IS_PHYSICAL_CAMERA_ORIENTATION_VARIABLE_STATIC_0100
     * @tc.desc   isPhysicalCameraOrientationVariable SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_IS_PHYSICAL_CAMERA_ORIENTATION_VARIABLE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_IS_PHYSICAL_CAMERA_ORIENTATION_VARIABLE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let res = mCameraInput!.isPhysicalCameraOrientationVariable();
            expect(isEmptyBoolean(res)).assertFalse();
            console.info(TAG, testName, "Entering start PASSED", res);
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_PHYSICAL_CAMERA_ORIENTATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_PHYSICAL_CAMERA_ORIENTATION_STATIC_0100
     * @tc.desc   getPhysicalCameraOrientation SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_PHYSICAL_CAMERA_ORIENTATION_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_PHYSICAL_CAMERA_ORIENTATION_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let res = mCameraInput!.getPhysicalCameraOrientation();
            expect(isEmptyNumber(res)).assertFalse();
            console.info(TAG, testName, "Entering start PASSED", JSON.stringify(res));
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OFF_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OFF_ERROR_STATIC_0100
     * @tc.desc   PhotoSession offError SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OFF_ERROR_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_OFF_ERROR_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let count = 0;
            mPhotoSession!.onError((err: BusinessError) => {
              console.error(`Camera input error code: ${err.code}`);
              count = 1;
            })
            console.info(TAG, testName, "Entering start");
            if (mPhotoSession!.isAutoDeviceSwitchSupported()) {
              mPhotoSession!.enableAutoDeviceSwitch(true);
              await Utils.msSleep(500);
              expect(count).assertEqual(0);
              mPhotoSession!.offError();
              console.info(TAG, testName, "Entering start PASSED");
            } else {
              console.info(TAG, testName, "当前设备不支持此功能");
              mPhotoSession!.offError();
            }

          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0100
     * @tc.desc   usePhysicalCameraOrientation SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let count = 0;
            mCameraInput!.onError(mCameraDeviceArray![0], (err: BusinessError) => {
              console.error(`Camera input error code: ${err.code}`);
              count = 1;
            })
            console.info(TAG, testName, "Entering start");
            if (mCameraInput!.isPhysicalCameraOrientationVariable()) {
              mCameraInput!.usePhysicalCameraOrientation(true);
              await Utils.msSleep(500);
              expect(count).assertEqual(0);
              mCameraInput!.offError(mCameraDeviceArray![0]);
              console.info(TAG, testName, "Entering start PASSED");
            } else {
              console.info(TAG, testName, "当前设备相机物理镜头角度不可变。");
              mCameraInput!.offError(mCameraDeviceArray![0]);
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0200
     * @tc.desc   usePhysicalCameraOrientation SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let count = 0;
            mCameraInput!.onError(mCameraDeviceArray![0], (err: BusinessError) => {
              console.error(`Camera input error code: ${err.code}`);
              count = 1;
            })
            console.info(TAG, testName, "Entering start");
            if (mCameraInput!.isPhysicalCameraOrientationVariable()) {
              mCameraInput!.usePhysicalCameraOrientation(false);
              await Utils.msSleep(500);
              expect(count).assertEqual(0);
              console.info(TAG, testName, "Entering start PASSED");
              mCameraInput!.offError(mCameraDeviceArray![0]);
            } else {
              console.info(TAG, testName, "当前设备相机物理镜头角度不可变。");
              mCameraInput!.offError(mCameraDeviceArray![0]);
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0300
     * @tc.desc   usePhysicalCameraOrientation not config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0300';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();

            await Utils.msSleep(1000);

            mPhotoSession!.beginConfig();

            if (mCameraInput != undefined) {
              console.info(TAG + "Start to addInput");
              mPhotoSession!.addInput(mCameraInput!);
            }

            if (mPreviewOutput != undefined) {
              console.info(TAG + "Start to addOutput mPreviewOutput");
              mPhotoSession!.addOutput(mPreviewOutput!);
            }

            if (mPhotoOutput != undefined) {
              console.info(TAG + "Start to addOutput mPhotoOutput");
              mPhotoSession!.addOutput(mPhotoOutput!);
            }
            console.info(TAG, testName, "Entering start");
            mCameraInput!.usePhysicalCameraOrientation(false);
            expect().assertFail();
            console.info(TAG, testName, "Entering start PASSED");
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0400
     * @tc.desc   usePhysicalCameraOrientation not config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0400',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0400';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await Utils.msSleep(1000);
            mPhotoSession!.beginConfig();
            if (mCameraInput != undefined) {
              console.info(TAG + "Start to addInput");
              mPhotoSession!.addInput(mCameraInput!);
            }
            if (mPreviewOutput != undefined) {
              console.info(TAG + "Start to addOutput mPreviewOutput");
              mPhotoSession!.addOutput(mPreviewOutput!);
            }

            if (mPhotoOutput != undefined) {
              console.info(TAG + "Start to addOutput mPhotoOutput");
              mPhotoSession!.addOutput(mPhotoOutput!);
            }
            console.info(TAG, testName, "Entering start");
            mCameraInput!.usePhysicalCameraOrientation(true);
            expect().assertFail();
            console.info(TAG, testName, "Entering start PASSED");
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0500
     * @tc.desc   usePhysicalCameraOrientation 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0500',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0500';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            console.info(TAG, testName, "Entering start");
            if (!mCameraInput!.isPhysicalCameraOrientationVariable()) {
              mCameraInput!.usePhysicalCameraOrientation(true);
              expect().assertFail();
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0600
     * @tc.desc   usePhysicalCameraOrientation 7400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0600',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_USE_PHYSICAL_CAMERA_ORIENTATION_STATIC_0600';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            console.info(TAG, testName, "Entering start");
            if (!mCameraInput!.isPhysicalCameraOrientationVariable()) {
              mCameraInput!.usePhysicalCameraOrientation(false);
              expect().assertFail();
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400102);
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OPEN_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OPEN_STATIC_0100
     * @tc.desc   OPEN the first parameter is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_OPEN_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_OPEN_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            console.info('Enter createInput');
            if (mCameraDeviceArray == undefined) {
              console.info(TAG + "Entering createInputs FAILED with NoCamera");
              return;
            }
            mCameraInput = mCameraManager!.createCameraInput(mCameraDeviceArray![0]);
            if (mCameraInput == undefined) {
              console.info(TAG + "createCameraInput FAILED");
              return;
            }
            let count = 0;
            mCameraInput!.onError(mCameraDeviceArray![0], (err: BusinessError) => {
              console.error(`Camera input error code: ${err.code}`);
              count = 1;
            })
            console.info(TAG, testName, "Entering  start", JSON.stringify(mCameraInput));
            await mCameraInput!.open(false);
            console.info(TAG, testName, "Entering  success");
            expect(count).assertEqual(0);
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          mCameraInput!.offError(mCameraDeviceArray![0]);
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORTED_STATIC_0100
     * @tc.desc   isExposureModeSupported api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORTED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORTED_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let result = mPhotoSession!.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO);
            console.info(TAG, testName, "Entering start PASSED", result);
            expect(isEmptyBoolean(result)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORTED_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORTED_STATIC_0200
     * @tc.desc   isExposureModeSupported api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORTED_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORTED_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            let result = mPhotoSession!.isExposureModeSupported(camera.ExposureMode.EXPOSURE_MODE_AUTO);
            console.info(TAG, testName, "Entering start PASSED", result);
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIAS_RANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIAS_RANGE_STATIC_0100
     * @tc.desc   getExposureBiasRange api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIAS_RANGE_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIAS_RANGE_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          const formats = [
            camera.ExposureMode.EXPOSURE_MODE_LOCKED,
            camera.ExposureMode.EXPOSURE_MODE_AUTO,
            camera.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO,
            camera.ExposureMode.EXPOSURE_MODE_MANUAL,
          ];

          for (const format of formats) {
            try {
              createPhotoOutput();
              await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
              if (mPhotoSession!.isExposureModeSupported(format)) {
                let mode: Array<number> = mPhotoSession!.getExposureBiasRange();
                console.info(TAG, testName, ' getExposureBiasRange, status: ', format, mode);
                expect(isEmptyArrayNumber(mode)).assertFalse();
              } else {
                console.error(TAG, testName, "getExposureBiasRange not supported on this device");
              }
              console.info(TAG, testName, "Entering start PASSED");
            } catch (err) {
              console.error(TAG, testName, " FAILED", err.code);
              expect().assertFail();
            }
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIAS_RANGE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIAS_RANGE_STATIC_0200
     * @tc.desc   getExposureBiasRange api 7400103
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIAS_RANGE_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_GET_EXPOSURE_BIAS_RANGE_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            mPhotoSession = mCameraManager!.createSession<camera.PhotoSession>(camera.SceneMode.NORMAL_PHOTO);
            mPhotoSession!.getExposureBiasRange();
            expect().assertFail();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(7400103);
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EMU_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_EMU_STATIC_0100
     * @tc.desc   EMU api BEAUTY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_EMU_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_EMU_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            let res = camera.ControlCenterEffectType.BEAUTY;
            console.info(TAG, testName, ' emu is : ', res);
            expect(res).assertEqual(0);
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_EMU_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_EMU_STATIC_0200
     * @tc.desc   EMU api PORTRAIT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_EMU_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_EMU_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            let res = camera.ControlCenterEffectType.PORTRAIT;
            console.info(TAG, testName, ' emu is : ', res);
            expect(res).assertEqual(1);
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0100
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode AUTO
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0100';
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.AUTO;
          let status = mPhotoSession!.isWhiteBalanceModeSupported(PMode);
          console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
          if (status) {
            mPhotoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.AUTO);
            let mode = mPhotoSession!.getWhiteBalanceMode();
            console.info(TAG, testName, "getWhiteBalanceMode :", mode);
            expect(mode).assertEqual(camera.WhiteBalanceMode.AUTO);
          } else {
            console.info(TAG, testName, "该设备不支持");
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0200
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode CLOUDY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0200';
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.CLOUDY;
          let status = mPhotoSession!.isWhiteBalanceModeSupported(PMode);
          console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
          if (status) {
            mPhotoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.CLOUDY);
            let mode = mPhotoSession!.getWhiteBalanceMode();
            console.info(TAG, testName, "getWhiteBalanceMode :", mode);
            expect(mode).assertEqual(camera.WhiteBalanceMode.CLOUDY);
          } else {
            console.info(TAG, testName, "该设备不支持");
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0300
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode INCANDESCENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0300';
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.INCANDESCENT;
          let status = mPhotoSession!.isWhiteBalanceModeSupported(PMode);
          console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
          if (status) {
            mPhotoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.INCANDESCENT);
            let mode = mPhotoSession!.getWhiteBalanceMode();
            console.info(TAG, testName, "getWhiteBalanceMode :", mode);
            expect(mode).assertEqual(camera.WhiteBalanceMode.INCANDESCENT);
          } else {
            console.info(TAG, testName, "该设备不支持");
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0400
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode FLUORESCENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0400';
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.FLUORESCENT;
          let status = mPhotoSession!.isWhiteBalanceModeSupported(PMode);
          console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
          if (status) {
            mPhotoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.FLUORESCENT);
            let mode = mPhotoSession!.getWhiteBalanceMode();
            console.info(TAG, testName, "getWhiteBalanceMode :", mode);
            expect(mode).assertEqual(camera.WhiteBalanceMode.FLUORESCENT);
          } else {
            console.info(TAG, testName, "该设备不支持");
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0500
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode MANUAL
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0500';
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.MANUAL;
          let status = mPhotoSession!.isWhiteBalanceModeSupported(PMode);
          console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
          if (status) {
            mPhotoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.MANUAL);
            let mode = mPhotoSession!.getWhiteBalanceMode();
            console.info(TAG, testName, "getWhiteBalanceMode :", mode);
            expect(mode).assertEqual(camera.WhiteBalanceMode.MANUAL);
          } else {
            console.info(TAG, testName, "该设备不支持");
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0600
     * @tc.desc   setWhiteBalanceMode camera WhiteBalanceMode LOCKED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_SET_WHITE_BALANCE_MODE_STATIC_0600';
      try {
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, ' mCameraDeviceArray is null.');
        } else {
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          let PMode: camera.WhiteBalanceMode = camera.WhiteBalanceMode.LOCKED;
          let status = mPhotoSession!.isWhiteBalanceModeSupported(PMode);
          console.info(TAG, testName, "isWhiteBalanceModeSupported :", status);
          if (status) {
            mPhotoSession!.setWhiteBalanceMode(camera.WhiteBalanceMode.LOCKED);
            let mode = mPhotoSession!.getWhiteBalanceMode();
            console.info(TAG, testName, "getWhiteBalanceMode :", mode);
            expect(mode).assertEqual(camera.WhiteBalanceMode.LOCKED);
          } else {
            console.info(TAG, testName, "该设备不支持");
          }
        }
      } catch (error) {
        console.error(TAG, testName + ' failed. err: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
      }
      await releasePhotoSession();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100
     * @tc.desc   isAutoDeviceSwitchSupported api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            let result = mPhotoSession!.isAutoDeviceSwitchSupported();
            console.info(TAG, testName, "Entering start PASSED", result);
            expect(isEmptyBoolean(result)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100
     * @tc.desc   enableAutoDeviceSwitch api the first parameter is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_SESSION_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          try {
            createPhotoOutput();
            await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
            if (mPhotoSession!.isAutoDeviceSwitchSupported()) {
              mPhotoSession!.enableAutoDeviceSwitch(false);
              console.info(TAG, testName, "Entering start PASSED");
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_IS_MIRROR_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_IS_MIRROR_SUPPORTED_STATIC_0100
     * @tc.desc   isMirrorSupported api success
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_IS_MIRROR_SUPPORTED_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_IS_MIRROR_SUPPORTED_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          try {
            let res = mPhotoOutput!.isMirrorSupported();
            console.info(TAG, testName, "Entering start PASSED", 'is', res);
            expect(isEmptyBoolean(res)).assertFalse();
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0100
     * @tc.desc   enableMirror api the first parameter is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0100';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          try {
            if (mPhotoOutput!.isMirrorSupported() && mPhotoOutput!.isMovingPhotoSupported()) {
              mPhotoOutput!.enableMirror(false);
              console.info(TAG, testName, "Entering start PASSED", 'is');
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect().assertFail();
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0200
     * @tc.desc   enableMirror api the first parameter is false 不支持调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0200';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          try {
            if (!mPhotoOutput!.isMirrorSupported()) {
              mPhotoOutput!.enableMirror(false);
              console.info(TAG, testName, "Entering start PASSED", 'is');
              expect().assertFail();
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(11);
          }
          await releasePhotoSession();
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0300
     * @tc.desc   enableMirror api the first parameter is true 不支持调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        const testName = 'SUB_MULTIMEDIA_CAMERA_ENABLE_MIRROR_STATIC_0300';
        if (isEmptyCameraManager(mCameraManager) && isEmptyCameraDevice(mCameraDeviceArray)) {
          console.info(TAG, testName, "Entering FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG + testName + "Entering start for camera");
          createPhotoOutput();
          await getCreatePhotoSession(mPreviewOutput!, mPhotoOutput!);
          try {
            if (!mPhotoOutput!.isMirrorSupported()) {
              mPhotoOutput!.enableMirror(true);
              console.info(TAG, testName, "Entering start PASSED", 'is');
              expect().assertFail();
            }
          } catch (err) {
            console.error(TAG, testName, " FAILED", err.code);
            expect(Number(err.code)).assertEqual(11);
          }
          await releasePhotoSession();
          done();
        }
      })
  })
}
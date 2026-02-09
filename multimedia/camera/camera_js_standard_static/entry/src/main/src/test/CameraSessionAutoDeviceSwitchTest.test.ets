/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import cameraObj from '@ohos.multimedia.camera';
import display from '@ohos.display';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { BusinessError } from '@ohos.base';
import Context from "application.Context";
import Utils from './Util.test';

const TAG = "CameraSessionAutoDeviceSwitchTest: ";

let mCameraManager: cameraObj.CameraManager | undefined;
let mCameraDevicesArray: Array<cameraObj.CameraDevice> = [];
let mCameraSession: cameraObj.PhotoSession | undefined;
let mCameraNum: number;
let mPhotoSurface: string;
let receiver: image.ImageReceiver | undefined;
let mCameraInput: cameraObj.CameraInput | undefined;
let mPreviewOutput: cameraObj.PreviewOutput | undefined;
let surfaceId: string = '';

export default function cameraSessionAutoDeviceSwitchTest() {

  let isEmpty01 = (data: cameraObj.CameraManager) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty02 = (data: Array<cameraObj.CameraDevice>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty04 = (data: cameraObj.CameraInput) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty05 = (data: cameraObj.CameraOutputCapability) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty06 = (data: Array<cameraObj.Profile>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty07 = (data: cameraObj.PreviewOutput) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getPreviewOutputSurface = () => {
    console.log(TAG + 'Entering getPreviewOutputSurface')
    try {
      surfaceId = Hypium.get('SurfaceId') as string;
    } catch(err) {
      console.info(TAG +
        "getPreviewOutputSurface FAILED err " + JSON.stringify(err));
    }
    if (surfaceId == '') {
      console.error(TAG + ' getPreviewOutputSurface surfaceId failed, surfaceId is null')
      expect().assertFail();
    }
    console.info(TAG + 'getPreviewOutputSurface surfaceId: ' + surfaceId)
  }

  let mgetCameraManagerInstance = () => {
    console.info(TAG + 'Enter mgetCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (isEmpty01(mCameraManager!)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info(TAG + 'Exit mgetCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info(TAG + 'Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager!.getSupportedCameras();
    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }
    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info(TAG + 'Exit getCameraSupportDevicesArray');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession!.release();
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');
    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager!.createCameraInput(mCameraDevicesArray[idx.toInt()]);
    if (isEmpty04(mCameraInput!)) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }
    await mCameraInput!.open();
    console.info(idx + 'th CameraInput is: ' + mCameraInput);
    console.info('Exit createInput');
    return true;
  }

  let createOutput = (idx: int) => {
    console.info('Enter createOutput');
    let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()], cameraObj.SceneMode.NORMAL_PHOTO);
    if (!isEmpty05(cameraOutputCap)) {
      if (!isEmpty06(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          try {
            mPreviewOutput = mCameraManager!.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          } catch (error) {
            console.info('  createPreviewOutput failed');
            console.info('  createPreviewOutput FAILED : ' + error);
          }
          if (!isEmpty07(mPreviewOutput!)) {
            console.info('  createPreviewOutput');
            break;
          }
        }
        if (isEmpty07(mPreviewOutput!)) {
          console.info(TAG + "createPreviewOutput FAILED");
        }
        console.info(TAG + "  createPreviewOutput: " + mPreviewOutput);
        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }
    }
    console.info('  createPreviewOutput end');
    console.info('Exit createOutputs');
    return true;
  }

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver({height:480, width:640} as image.Size, image.ImageFormat.JPEG, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver!.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  describe('cameraSessionAutoDeviceSwitchTest', () => {
    console.info(TAG + '----------cameraSessionAutoDeviceSwitchTest--------------')
    beforeAll(() => {
      console.info('Enter createOutput');
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      mgetCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
    })

    beforeEach(() => {
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100
     * @tc.desc   Checks if the automatic switchover device is supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        let isFoldable = display.isFoldable();
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_0100 isFoldable:" + isFoldable);
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100 start for camera[" + i +
            "]");
          await createInput(i);

          createOutput(i);
          try {
            mCameraSession = mCameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
          } catch (error) {
            console.info('createCaptureSession FAILED');
            expect().assertFail();
            done();
          }

          if (mCameraSession == undefined) {
            console.log("  mCameraSession is null")
          } else {
            console.log("  mCameraSession create success")
          }

          mCameraSession!.beginConfig();
          if (isEmpty04(mCameraInput!)) {
            console.info(TAG + "cameraInput is null.");
            expect().assertFail();
            done();
          }
          mCameraSession!.addInput(mCameraInput!);
          if (isEmpty07(mPreviewOutput!)) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            expect().assertFail();
            done();
          }
          mCameraSession!.addOutput(mPreviewOutput!);
          await mCameraSession!.commitConfig();
          let isSupported: boolean = mCameraSession!.isAutoDeviceSwitchSupported();
          if (isSupported != isFoldable) {
            expect().assertFail();
          }
          await mCameraSession!.start();
          await mCameraSession!.stop();
          await mCameraInput!.close();
          await mCameraSession!.release();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100 end for camera[" + i + "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_IS_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100
     * @tc.desc   Enables or disables the automatic switchover device.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100 start for camera[" + i + "]");
          await createInput(i);
          createOutput(i);
          try {
            mCameraSession = mCameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
          } catch (error) {
            console.info('createCaptureSession FAILED');
            expect().assertFail();
            done();
          }
          mCameraSession!.beginConfig();
          if (isEmpty04(mCameraInput!)) {
            console.info(TAG + "cameraInput is null.");
            expect().assertFail();
            done();
          }
          mCameraSession!.addInput(mCameraInput!);
          if (isEmpty07(mPreviewOutput!)) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            expect().assertFail();
            done();
          }
          mCameraSession!.addOutput(mPreviewOutput!);
          await mCameraSession!.commitConfig();
          let isSupported: boolean = mCameraSession!.isAutoDeviceSwitchSupported();
          if (isSupported) {
            try {
              mCameraSession!.enableAutoDeviceSwitch(true);
            } catch (error) {
              expect().assertFail();
            }
          }
          await mCameraSession!.start();
          await mCameraSession!.stop();
          await mCameraInput!.close();
          await mCameraSession!.release();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100 end for camera[" + i + "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100 ends here");
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100
     * @tc.desc   CCheck whether the interception switchover is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100 start for camera[" + i + "]");
          await createInput(i);
          createOutput(i);
          try {
            mCameraSession = mCameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
          } catch (error) {
            console.info('createCaptureSession FAILED');
            expect().assertFail();
            done();
          }
          mCameraSession!.beginConfig();
          if (isEmpty04(mCameraInput!)) {
            console.info(TAG + "cameraInput is null.");
            expect().assertFail();
            done();
          }
          mCameraSession!.addInput(mCameraInput!);
          if (isEmpty07(mPreviewOutput!)) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            expect().assertFail();
            done();
          }
          mCameraSession!.addOutput(mPreviewOutput!);
          await mCameraSession!.commitConfig();
          let isSupported: boolean = mCameraSession!.isAutoDeviceSwitchSupported();
          if (isSupported) {
            try {
              mCameraSession!.enableAutoDeviceSwitch(true);
            } catch (error) {
              expect().assertFail();
            }
            mCameraSession!.onAutoDeviceSwitchStatusChange((error: BusinessError | null, autoDeviceSwitchStatus: cameraObj.AutoDeviceSwitchStatus | undefined) => {
              if (error !== undefined && error!.code !== 0) {
                expect().assertFail();
              }
              let isDeviceSwitched: boolean = autoDeviceSwitchStatus!.isDeviceSwitched;
              let isDeviceCapabilityChanged: boolean = autoDeviceSwitchStatus!.isDeviceCapabilityChanged;
              console.info(TAG + `Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100 isDeviceSwitched ${isDeviceSwitched} isDeviceCapabilityChanged ${isDeviceCapabilityChanged}`);
              done();
            })
          }
          await mCameraSession!.start();
          await mCameraSession!.stop();
          await mCameraInput!.close();
          await mCameraSession!.release();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100 end for camera[" +
            i + "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_ON_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_OFF_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_OFF_STATIC_0100
     * @tc.desc   CCheck whether the interception switchover is successful.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_OFF_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_OFF_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_OFF_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_OFF_STATIC_0100 start for camera[" + i + "]");
          await createInput(i);
          createOutput(i);
          try {
            mCameraSession = mCameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
          } catch (error) {
            console.info('createCaptureSession FAILED');
            expect().assertFail();
            done();
          }
          mCameraSession!.beginConfig();
          if (isEmpty04(mCameraInput!)) {
            console.info(TAG + "cameraInput is null.");
            expect().assertFail();
            done();
          }
          mCameraSession!.addInput(mCameraInput!);
          if (isEmpty07(mPreviewOutput!)) {
            console.info(TAG + "Start to addOutput mPreviewOutput");
            expect().assertFail();
            done();
          }
          mCameraSession!.addOutput(mPreviewOutput!);
          await mCameraSession!.commitConfig();
          let isSupported: boolean = mCameraSession!.isAutoDeviceSwitchSupported();
          if (isSupported) {
            try {
              mCameraSession!.enableAutoDeviceSwitch(true);
            } catch (error) {
              expect().assertFail();
            }
            let callback = (error: BusinessError | null, autoDeviceSwitchStatus: cameraObj.AutoDeviceSwitchStatus | undefined) => {
              expect().assertFail();
            }
            mCameraSession!.onAutoDeviceSwitchStatusChange(callback);
            mCameraSession!.offAutoDeviceSwitchStatusChange(callback);
          }
          await mCameraSession!.start();
          await mCameraSession!.stop();
          await mCameraInput!.close();
          await mCameraSession!.release();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_OFF_STATIC_0100 end for camera[" +
            i + "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_AUTO_DEVICE_SWITCH_OFF_STATIC_0100 ends here");
        done();
      }
    })
  })
}
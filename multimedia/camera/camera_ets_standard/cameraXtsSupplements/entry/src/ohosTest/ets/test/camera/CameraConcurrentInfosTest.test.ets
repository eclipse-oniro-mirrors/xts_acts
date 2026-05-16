/*
 * Copyright (C) 2025-2025 Huawei Device Co., Ltd.
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


import camera from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { getPermission, driveFn } from '../common';

const TAG = "CameraConcurrentTestSupp: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;
let receiver: image.ImageReceiver;
let context = getContext();


let power: ESObject;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let ability = async () => {
  const delegator = abilityDelegatorRegistry.getAbilityDelegator()
  const bundleName = abilityDelegatorRegistry.getArguments().bundleName
  const want: Want = {
    bundleName: bundleName,
    abilityName: 'TestAbility'
  }
  await delegator.startAbility(want)
  await sleep(500)
}

function getEnumMaxValue<T extends Record<string, number | string>>(enumeration: T): number {
  const values = Object.values(enumeration);
  const numberValues = values.filter(v => typeof v === 'number') as number[];
  let maxValue = Math.max(...numberValues);
  console.info(TAG,'getEnumMaxValue : ' + maxValue);
  return maxValue;
}

export function isSupportCameras() : boolean {
  const cameraAvailable = canIUse('SystemCapability.Multimedia.Camera.Core');
  let context = getContext();
  let isSupportedCameras = true;
  let isSupportCamera = false;
  let mCameraManager: camera.CameraManager;
  let mCameraDevicesArray: Array<camera.CameraDevice>;

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  console.info(TAG + 'Enter getCameraManagerInstance');
  mCameraManager = camera.getCameraManager(context);
  if (isEmpty(mCameraManager)) {
    console.info(TAG + "getCameraManager FAILED");
    return false;
  }
  console.info(TAG + 'Exit getCameraManagerInstance');
  mCameraDevicesArray = mCameraManager.getSupportedCameras();
  if (isEmpty(mCameraDevicesArray)) {
    isSupportedCameras = false;
  }
  if (cameraAvailable && isSupportedCameras) {
    isSupportCamera = true;
  } else {
    isSupportCamera = false;
  }
  return isSupportCamera;
}

export function CameraConcurrentTest() {
  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + JSON.stringify(mPhotoSurface))
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    mCameraManager = camera.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  describe('CameraConcurrentTest', () => {
    console.info(TAG + '----------CameraConcurrentTest--------------')
    beforeAll(async () => {
      let dr = Driver.create();
      sleep(1000);
      await getPermission();
      await driveFn();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
      await ability();
    })

    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(async () => {
      console.info('afterAll case');
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_001
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_001
     * @tc.desc   check camerainput open by concurrent cameraPosition -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_001', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_001 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: -1,
            cameraOrientation: 270,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_001 camera concurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }
      catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraId is empty: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_002
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_002
     * @tc.desc   check camerainput open by concurrent cameraPosition 4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_002', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_002 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let maxEnum = getEnumMaxValue(camera.CameraPosition);
        let devicesArray: camera.CameraDevice[] = [
          {
            cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: maxEnum + 1,
            cameraOrientation: 180,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_002 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_003
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_003
     * @tc.desc   check camerainput open by concurrent cameraType 5
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_003', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_003 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let maxEnum = getEnumMaxValue(camera.CameraType);
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: maxEnum + 1,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation: 180,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_003 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_004
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_004
     * @tc.desc   check camerainput open by concurrent cameraType -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_004', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_004 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          {
            cameraId: "lcam001",
            cameraType: -1,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation: 180,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_004 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_005
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_005
     * @tc.desc   check camerainput open by concurrent cameraOrientation -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_005', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_005 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:-1,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_005 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_006
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_006
     * @tc.desc   check camerainput open by concurrent cameraOrientation 361
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_006', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_006 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          {
            cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation: 361,
            connectionType: camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_006 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_007
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_007
     * @tc.desc   check camerainput open by concurrent ConnectionType 3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_007', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_007 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let maxEnum = getEnumMaxValue(camera.ConnectionType);
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType: maxEnum + 1,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_007 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_008
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_008
     * @tc.desc   check camerainput open by concurrent ConnectionType -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_008', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_008 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType: -1,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_008 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch (err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: cameraPosition is max+1: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_009
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_009
     * @tc.desc   check camerainput open by concurrent hostDeviceName empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_009', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_009 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType:camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType: camera.HostDeviceType.UNKNOWN_TYPE
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_009 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: hostDeviceName is Empty: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_010
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_010
     * @tc.desc   check camerainput open by concurrent hostDeviceType -1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_010', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_010 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType:camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType:-1
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_010 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: hostDeviceType is -1: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_011
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_011
     * @tc.desc   check camerainput open by concurrent hostDeviceType  0x12
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_011', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_011 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let maxEnum = getEnumMaxValue(camera.HostDeviceType);
        let devicesArray: camera.CameraDevice[] = [
          { cameraId: "lcam001",
            cameraType: camera.CameraType.CAMERA_TYPE_DEFAULT,
            cameraPosition: camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED,
            cameraOrientation:180,
            connectionType:camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN,
            hostDeviceName: "",
            hostDeviceType:	maxEnum + 1
          }]
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_011 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      } catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: hostDeviceType is 0x12: " ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_012
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_012
     * @tc.desc   check camerainput open by concurrent CameraConcurrentInfos empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_012', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_012 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] = []
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_012 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }
      catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: CameraConcurrentInfos is empty: "  ,err.message,  err.code);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_013
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_013
     * @tc.desc   check camerainput open by concurrent CameraConcurrentInfos null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_013', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_013 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] | null= null
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_013 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }
      catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: CameraConcurrentInfos is null: "  ,err.message,  err.code);
        expect(err.code == 401).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_014
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_014
     * @tc.desc   check camerainput open by concurrent CameraConcurrentInfos undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_014', Level.LEVEL0, async (done: Function) => {
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_014 FAILED with NoCamera");
      }
      console.log(TAG + "mCameraDevicesArray: " + JSON.stringify(mCameraDevicesArray))
      try {
        let devicesArray: camera.CameraDevice[] | undefined= undefined
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(devicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_ERROR_014 cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        expect(cameraConcurrentInfos.length == 0 ).assertTrue();
      }
      catch(err) {
        console.info(TAG + "The getCameraConcurrentInfos call failed: CameraConcurrentInfos is undefined: "  ,err.message,  err.code);
        expect(err.code == 401).assertTrue();
      }
      done();
    })

  })
}
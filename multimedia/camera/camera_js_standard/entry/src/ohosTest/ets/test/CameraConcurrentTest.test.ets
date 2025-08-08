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
import { surfaceIds } from '../testability/pages/Index';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

const TAG = "CameraConcurrentTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession;

let mPhotoSurface: string | camera.Profile;
let mCameraNum: number;

let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput | null = null;
let mPhotoOutput: camera.PhotoOutput | null = null;
let mVideoOutput: camera.VideoOutput | null = null;
let nbiasRangeArray: Array<number> ;
let nzoomRatioRange: Array<number> = [];

let receiver: image.ImageReceiver;
let context = getContext();

let permission = ['ohos.permission.GRANT_SENSITIVE_PERMISSIONS',
  'ohos.permission.REVOKE_SENSITIVE_PERMISSIONS',
  'ohos.permission.CAMERA',
  'ohos.permission.MICROPHONE',
  'ohos.permission.MEDIA_LOCATION',
  'ohos.permission.READ_MEDIA',
  'ohos.permission.WRITE_MEDIA',
  'ohos.permission.START_ABILIIES_FROM_BACKGROUND',
  'ohos.permission.START_INVISIBLE_ABILITY',
  'ohos.permission.ABILITY_BACKGROUND_COMMUNICATION',
];

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
  await sleep(1000)
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
      sleep(100);
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
      await ability();
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_0100
     * @tc.name      : check get camera device by position and type
     * @tc.desc      : check get camera device by position and type
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_0100', Level.LEVEL0, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        for (let i = 0; i < mCameraDevicesArray.length; i++) {
          let cameraPosition = mCameraDevicesArray[i].cameraPosition;
          let cameraType = mCameraDevicesArray[i].cameraType;
          let curCameraDev: camera.CameraDevice = mCameraManager.getCameraDevice(cameraPosition, cameraType);
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_0100 Success camera[" + i +"] curCameraDev: " + JSON.stringify(curCameraDev));
          if (!isEmpty(curCameraDev)) {
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_0100 Success camera[" + i +"]");
            expect(true).assertTrue();
          }
          else {
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_0100 FAILED camera[" + i +"]");
            expect(true).assertFalse();
          }

        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_ERRORCODE_0100
     * @tc.name      : check get camera device by position and type errorcode 401 
     * @tc.desc      : check get camera device by position and type errorcode 401
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_ERRORCODE_0100', Level.LEVEL2, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_ERRORCODE_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_ERRORCODE_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        for (let i = 0; i < mCameraDevicesArray.length; i++) {
          let cameraPosition = mCameraDevicesArray[i].cameraPosition;
          let cameraType = mCameraDevicesArray[i].cameraType;
          try {
            let curCameraDev: camera.CameraDevice = mCameraManager.getCameraDevice(cameraPosition,null);
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_ERRORCODE_0100 Success camera[" + i +"] curCameraDev: " + JSON.stringify(curCameraDev));
            expect(true).assertFalse();
          } catch (err) {
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_ERRORCODE_0100  camera[" + i +"] errorcode = " + err.code);
            expect(err.code == 401).assertTrue();
          }
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100
     * @tc.name      : check get camera concurrent infos 
     * @tc.desc      : check get concurrent infos 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100', Level.LEVEL0, async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100 FAILED with NoCamera");
          expect(true).assertFail();
          done();
          return;
        }
        let cameraconcurrentinfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(mCameraDevicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100 Success  cameraconcurrentinfos: " + JSON.stringify(cameraconcurrentinfos));
        if (!isEmpty(cameraconcurrentinfos)) {
          for (let i = 0; i < cameraconcurrentinfos.length; i++) {
            let cameradevice = cameraconcurrentinfos[i].device;
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100 Success  cameradevice: " + JSON.stringify(cameradevice));
            let CameraConcurrentType = cameraconcurrentinfos[i].type;
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100 Success  CameraConcurrentType: " + JSON.stringify(CameraConcurrentType));
            let SceneModes = cameraconcurrentinfos[i].modes;
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100 Success  SceneModes: " + JSON.stringify(SceneModes));
            let outputCapabilities = cameraconcurrentinfos[i].outputCapabilities;
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_0100 Success  outputCapabilities: " + JSON.stringify(outputCapabilities));
          }
        }
        done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONNCURRENT_TYPE_0100
     * @tc.name      : check camerainput open by concurrent type 
     * @tc.desc      : check camerainput open by concurrent type  
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONNCURRENT_TYPE_0100', Level.LEVEL0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONNCURRENT_TYPE_0200--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONNCURRENT_TYPE_0200 FAILED with NoCamera");
        expect(true).assertFail();
        done();
        return;
      }
      let cameraconcurrentinfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(mCameraDevicesArray);
      console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONNCURRENT_TYPE_0200 Success  cameraconcurrentinfos: " + JSON.stringify(cameraconcurrentinfos));
      if (!isEmpty(cameraconcurrentinfos)) {
        for (let i = 0; i < cameraconcurrentinfos.length; i++) {
            let cameraInput: camera.CameraInput = mCameraManager.createCameraInput(cameraconcurrentinfos[i].device);
            cameraInput.open(cameraconcurrentinfos[i].type);
            expect(true).assertTrue();
            await cameraInput.close();
        }
      }
      else {
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONNCURRENT_TYPE_0200   camera is not supported concurrenttype: ");
      }
      done();
    })
  })
}
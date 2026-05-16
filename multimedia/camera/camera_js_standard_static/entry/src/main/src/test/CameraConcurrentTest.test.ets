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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import Context from "application.Context";
import { BusinessError } from '@ohos.base';
import hilog from "@ohos.hilog";
import Utils from './Util.test';

const TAG = "CameraConcurrentTest: ";

let mCameraManager: camera.CameraManager;
let mCameraDevicesArray: Array<camera.CameraDevice>;
let mCameraSession: camera.PhotoSession;

let mPhotoSurface: string = '';
let mCameraNum: int = 0;

let mCameraInput: camera.CameraInput;
let mPreviewOutput: camera.PreviewOutput | null = null;
let mPhotoOutput: camera.PhotoOutput | null = null;
let mVideoOutput: camera.VideoOutput | null = null;
let nbiasRangeArray: Array<number> ;
let nzoomRatioRange: Array<number> = [];

let receiver: image.ImageReceiver | undefined;

export default function cameraConcurrentTest() {

  let isEmpty01 = (data: camera.CameraManager) => {
    if (data == null || data == undefined) {
        return true;
      }
      return false;
  }

  let isEmpty02 = (data: Array<camera.CameraDevice>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }
  
  let isEmpty03 = (data: camera.CameraDevice) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }
  
  let isEmpty04 = (data: Array<camera.CameraConcurrentInfo>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver({height:640, width:480} as image.Size, image.ImageFormat.JPEG, 8)
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

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    console.info('get Context end');
    mCameraManager = camera.getCameraManager(appContext);
    if (isEmpty01(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info('Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty02(mCameraDevicesArray)) {
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

    beforeAll(() => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
      await Utils.msSleep(500);
    })

    beforeEach(() => {
      await Utils.msSleep(100);
      console.info('beforeEach case');
      await Utils.msSleep(100);
    })

    afterEach(() => {
      console.info('afterEach case');
    })

    afterAll(() => {
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_STATIC_0100
     * @tc.desc   check get camera device by position and type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_STATIC_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_STATIC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        }
        for (let i = 0; i < mCameraDevicesArray.length; i++) {
          let cameraPosition = mCameraDevicesArray[i].cameraPosition;
          let cameraType = mCameraDevicesArray[i].cameraType;
          let curCameraDev: camera.CameraDevice = mCameraManager.getCameraDevice(cameraPosition, cameraType);
          console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_STATIC_0100 Success camera[" + i +"] curCameraDev: " + JSON.stringify(curCameraDev));
          if (!isEmpty03(curCameraDev)) {
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_STATIC_0100 Success camera[" + i +"]");
          }
          else {
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICE_BY_POSITION_TYPE_STATIC_0100 FAILED camera[" + i +"]");
            expect(true).assertFalse();
          }

        }
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100
     * @tc.desc   check get concurrent infos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100--------------");
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        }
        let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(mCameraDevicesArray);
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100 Success  cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
        if (!isEmpty04(cameraConcurrentInfos)) {
          for (let i = 0; i < cameraConcurrentInfos.length; i++) {
            let cameraDevice = cameraConcurrentInfos[i].device;
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100 Success  cameraDevice: " + JSON.stringify(cameraDevice));
            let CameraConcurrentType = cameraConcurrentInfos[i].type;
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100 Success  CameraConcurrentType: " + JSON.stringify(CameraConcurrentType));
            let SceneModes = cameraConcurrentInfos[i].modes;
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100 Success  SceneModes: " + JSON.stringify(SceneModes));
            let outputCapabilities = cameraConcurrentInfos[i].outputCapabilities;
            console.info(TAG + " SUB_MULTIMEDIA_CAMERA_GET_CAMERA_CONCURRENT_INFOS_STATIC_0100 Success  outputCapabilities: " + JSON.stringify(outputCapabilities));
          }
        }
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_TYPE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_TYPE_STATIC_0100
     * @tc.desc   check cameraInput open by concurrent type
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_TYPE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_TYPE_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_TYPE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      }
      let cameraConcurrentInfos: Array<camera.CameraConcurrentInfo> = mCameraManager.getCameraConcurrentInfos(mCameraDevicesArray);
      console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_TYPE_STATIC_0100 Success  cameraConcurrentInfos: " + JSON.stringify(cameraConcurrentInfos));
      if (!isEmpty04(cameraConcurrentInfos)) {
        for (let i = 0; i < cameraConcurrentInfos.length; i++) {
            let cameraInput: camera.CameraInput = mCameraManager.createCameraInput(cameraConcurrentInfos[i].device);
            cameraInput.open(cameraConcurrentInfos[i].type);
            await cameraInput.close();
        }
      }
      else {
        console.info(TAG + " SUB_MULTIMEDIA_CAMERA_INPUT_OPEN_BY_CONCURRENT_TYPE_STATIC_0100   camera is not supported concurrenttype: ");
      }
      done();
    })
  })
}
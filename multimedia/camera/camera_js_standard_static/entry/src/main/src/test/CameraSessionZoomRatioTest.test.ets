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
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';
import { Hypium } from '../../../hypium/index';
import Context from "application.Context";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

const TAG = "CameraSessionZoomRatioTest: ";

let mCameraManager: cameraObj.CameraManager | undefined;
let mCameraDevicesArray: Array<cameraObj.CameraDevice> | undefined;
let mCameraSession: cameraObj.PhotoSession | undefined;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput | undefined;
let mPreviewOutput: cameraObj.PreviewOutput | undefined;
let mPhotoOutput: cameraObj.PhotoOutput | undefined;
let defaultSize: int = 2;
let indexZero: int = 0;
let indexOne: int = 1;

export default function cameraSessionZoomRatioTest() {

  let receiver: image.ImageReceiver | undefined;
  let mPhotoSurface: string = "";
  let surfaceId: string = '';

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

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver({height:960, width:1280} as image.Size, image.ImageFormat.JPEG, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Photo receiver is created successfully')
      mPhotoSurface = await receiver!.getReceivingSurfaceId()
      console.log(TAG + 'Photo received id: ' + mPhotoSurface)
    } else {
      console.log(TAG + 'Photo receiver is created failed')
    }
    console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (mCameraManager == null) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }

    console.info('Exit getCameraManagerInstance');

    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');

    mCameraDevicesArray = mCameraManager!.getSupportedCameras();
    /*
    mCameraManager.getSupportedCameras(async (err, data) => {
        console.info(TAG + "Entering getCameraSupportDevicesArray callback");
        if (!err) {
            if (data != null || data != undefined) {
                mCameraDevicesArray = data;
                console.info(TAG + "Entering getCameraSupportDevicesArray PASSED with CameraDevicesArray is: " + data);
            } else {
                console.info(TAG + "Entering getCameraSupportDevicesArray FAILED with CameraDevicesArray is: " + data);
            }
        } else {
            console.info(TAG + "Entering getCameraSupportDevicesArray FAILED : " + err.message);
        }
    })
    await Utils.msSleep(3000);
    */
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray!.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
    } catch(err) {
      console.info('createCaptureSession FAILED');
    }

    if (mCameraSession == undefined) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }

    mCameraSession!.beginConfig();

    console.info('Exit createCameraSessionInstance');

    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession!.release();
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');

    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    mCameraInput = mCameraManager!.createCameraInput(mCameraDevicesArray![idx.toInt()]);

    if (mCameraInput == undefined) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }

    await mCameraInput!.open();

    await Utils.msSleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info('Enter releaseInput');

    if (mCameraInput != undefined && mCameraInput != null) {
      await mCameraInput!.close();
    }

    console.info('Exit releaseInput');

    return true;
  }

  let createOutput = (idx: int) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDevicesArray![idx.toInt()], cameraObj.SceneMode.NORMAL_PHOTO);

    if (cameraOutputCap != undefined) {
      if (cameraOutputCap.previewProfiles != null) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager!.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          if (mPreviewOutput != undefined) {
            break;
          }
        }

        if (mPreviewOutput == undefined) {
          console.info(TAG + "createPreviewOutput FAILED");
        }

        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }

      if (cameraOutputCap.photoProfiles != null) {
        console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

        for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
          mPhotoOutput = mCameraManager!.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
          if (mPhotoOutput != undefined) {
            break;
          }
        }

        if (mPhotoOutput == undefined) {
          console.info(TAG + "createPhotoOutput FAILED");
        }

        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
      }
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async (): Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (mPreviewOutput != undefined && mPreviewOutput != null) {
      await mPreviewOutput!.release();
    }

    if (mPhotoOutput != undefined && mPhotoOutput != null) {
      await mPhotoOutput!.release();
    }
    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: int): Promise<boolean> => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    await Utils.msSleep(1);

    if (mCameraInput != undefined) {
      console.info(TAG + "Start to addInput");
      mCameraSession!.addInput(mCameraInput!);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession!.addOutput(mPreviewOutput!);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to addOutput mPhotoOutput");
      mCameraSession!.addOutput(mPhotoOutput!);
    }
    await Utils.msSleep(1);

    await mCameraSession!.commitConfig();
    console.info(TAG + "commitConfig end");
    await mCameraSession!.start();
    console.info(TAG + "start end");

    await Utils.msSleep(1000);
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");

    await mCameraSession!.stop();
    console.info(TAG + "stop end");

    mCameraSession!.beginConfig();
    console.info(TAG + "beginConfig end");

    await Utils.msSleep(100);

    if (mCameraInput != undefined) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession!.removeInput(mCameraInput!);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession!.removeOutput(mPreviewOutput!);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPhotoOutput");
      mCameraSession!.removeOutput(mPhotoOutput!);
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('cameraSessionZoomRatioTest', () => {
    console.info(TAG + '----------cameraSessionZoomRatioTest--------------')
    beforeAll(() => {
      try {
        Utils.msSleep(100);
        console.info('beforeAll case');
        await Utils.msSleep(500);
      } catch (err) {
        console.info(TAG + "  cameraSessionZoomRatioTest beforeAll FAILED: " + err);
      }

      console.info('  cameraSessionZoomRatioTest beforeAll case');
      await Utils.msSleep(1000);
      
    })

    beforeEach(() => {
      Utils.msSleep(5000);
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      console.info('  cameraSessionZoomRatioTest beforeEach case');
    })

    afterEach(() => {
      await releaseCameraSessionInstance();
      console.info('  cameraSessionZoomRatioTest afterEach case');
    })

    afterAll(() => {
      await releaseCameraSessionInstance();
      Utils.msSleep(1000);
      console.info('  cameraSessionZoomRatioTest afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100
     * @tc.desc   Check capture session set zoom ratio with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 start for camera[" + i + "]");

          await startCameraSession(i);
          let supportedZoomRatioRange: Array<number> = mCameraSession!.getZoomRatioRange();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 supportedZoomRatioRange.length: " + supportedZoomRatioRange.length);
          if (supportedZoomRatioRange.length > 0) {

            if (mCameraSession!.isAutoDeviceSwitchSupported()){
              mCameraSession!.setZoomRatio(supportedZoomRatioRange[0]);
              await Utils.msSleep(1000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 finish");
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 PASSED with ZoomRatio is: " +
              supportedZoomRatioRange[0]);

              let zoomRatio: number = mCameraSession!.getZoomRatio();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 finish");
              if (zoomRatio == supportedZoomRatioRange[0]) {
                console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 PASSED with ZoomRatio is: " +
                  zoomRatio);
              } else {
                console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 FAILED with ZoomRatio is: " +
                  zoomRatio);
                expect().assertFail();
              }
            }
          }
          await stopCameraSession();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200
     * @tc.desc   Check capture session set zoom ratio with promise(invalid value, max + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 start for camera[" + i + "]");

          await startCameraSession(i);
          let supportedZoomRatioRange: Array<number> = mCameraSession!.getZoomRatioRange();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 supportedZoomRatioRange.length: " + supportedZoomRatioRange.length);
          if (supportedZoomRatioRange.length == defaultSize) {
            mCameraSession!.setZoomRatio((supportedZoomRatioRange[indexOne] + 1));
            await Utils.msSleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 PASSED with ZoomRatio is: " +
              (supportedZoomRatioRange[indexOne] + 1));

            let zoomRatio: number= mCameraSession!.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 finish");
            if (zoomRatio != (supportedZoomRatioRange[indexOne] + 1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }
          }
          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0200 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300
     * @tc.desc   Check capture session set zoom ratio with promise(invalid value, max + 0.1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 start for camera[" + i + "]");

          await startCameraSession(i);
          let supportedZoomRatioRange: Array<number> = mCameraSession!.getZoomRatioRange();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 supportedZoomRatioRange.length: " + supportedZoomRatioRange.length);
          if (supportedZoomRatioRange.length == defaultSize) {
            mCameraSession!.setZoomRatio((supportedZoomRatioRange[indexOne] + 0.1) as number);
            await Utils.msSleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 PASSED with ZoomRatio is: " +
              (supportedZoomRatioRange[indexOne] + 0.1));

            let zoomRatio: number= mCameraSession!.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 finish");
            if (zoomRatio != (supportedZoomRatioRange[indexOne] + 0.1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }
          }
          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0300 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400
     * @tc.desc   Check capture session set zoom ratio with promise(invalid value, min - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 start for camera[" + i + "]");

          await startCameraSession(i);
          let supportedZoomRatioRange: Array<number> = mCameraSession!.getZoomRatioRange();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 supportedZoomRatioRange.length: " + supportedZoomRatioRange.length);
          if (supportedZoomRatioRange.length == defaultSize) {
            mCameraSession!.setZoomRatio((supportedZoomRatioRange[indexZero] - 1));
            await Utils.msSleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 PASSED with ZoomRatio is: " +
              (supportedZoomRatioRange[indexZero] - 1));

            let zoomRatio: number= mCameraSession!.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 finish");
            if (zoomRatio != (supportedZoomRatioRange[indexZero] - 1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }
          }
          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0400 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500
     * @tc.desc   Check capture session set zoom ratio with promise(invalid value, min - 0.1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 start for camera[" + i + "]");

          await startCameraSession(i);
          let supportedZoomRatioRange: Array<number> = mCameraSession!.getZoomRatioRange();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 supportedZoomRatioRange.length: " + supportedZoomRatioRange.length);
          if (supportedZoomRatioRange.length == defaultSize) {
            mCameraSession!.setZoomRatio((supportedZoomRatioRange[indexZero] - 0.1) as number);
            await Utils.msSleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 PASSED with ZoomRatio is: " +
              (supportedZoomRatioRange[indexZero] - 0.1));

            let zoomRatio: number= mCameraSession!.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 finish");
            if (zoomRatio != (supportedZoomRatioRange[indexZero] - 0.1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }
          }
          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_STATIC_0500 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200
     * @tc.desc   Check capture session set smooth zoom with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 start for camera[" +
            i + "]");

          await startCameraSession(i);
          let supportedZoomRatioRange: Array<number> = mCameraSession!.getZoomRatioRange();
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 supportedZoomRatioRange.length: " + supportedZoomRatioRange.length);
          let callbackFlag: boolean = false;
          if (supportedZoomRatioRange.length == defaultSize) {
            mCameraSession!.onSmoothZoomInfoAvailable(
              (err: BusinessError | null, smoothZoomInfo: cameraObj.SmoothZoomInfo | undefined): void => {
                if (!err || err.code == 0) {
                  console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 on smoothZoomInfoAvailable success");
                  callbackFlag = true;
                } else {
                  console.info(TAG +
                    "Error in SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 FAILED on smoothZoomInfoAvailable: " +
                  err.message);
                  expect().assertFail();
                }
              })
            if (mCameraSession!.isAutoDeviceSwitchSupported()) {
              mCameraSession!.setZoomRatio((supportedZoomRatioRange[indexZero] + 0.1) as number);
              await Utils.msSleep(1000);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 setZoomRatio: " +
                (supportedZoomRatioRange[indexZero] + 0.1));

              mCameraSession!.setSmoothZoom((supportedZoomRatioRange[indexOne] - 0.1) as number, cameraObj.SmoothZoomMode.NORMAL);
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 targetZoomRatio: " +
                (supportedZoomRatioRange[indexOne] - 0.1));
              await Utils.msSleep(2000);
              let zoomRatio: number= mCameraSession!.getZoomRatio();
              if ((zoomRatio - (supportedZoomRatioRange[indexOne] - 0.1)) < 0.01) {
                console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 PASSED with ZoomRatio is: " +
                  zoomRatio);
              } else {
                console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 FAILED with ZoomRatio is: " +
                  zoomRatio);
                expect().assertFail();
              }
            }
          }
          let callbackTimeOut: int = 0; // 5 seconds
          while (!callbackFlag && callbackTimeOut < 5000) {
            await Utils.msSleep(1000);
            callbackTimeOut += 1000;
            console.info(TAG + "Waiting for smoothZoomInfoAvailable callback, timeout:10000, now time: " + callbackTimeOut);
          }
          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 end for camera[" + i +
            "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_STATIC_0200 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_STATIC_0100
     * @tc.desc   Check camera session get supported color sapaces
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_STATIC_0100 start for camera[" + i + "]");
          await startCameraSession(i);
          try {
            let colorSpaces: Array<colorSpaceManager.ColorSpace> = mCameraSession!.getSupportedColorSpaces();
            console.info(TAG + "Entering get Supported Color Spaces type: " + colorSpaces);
            console.info(TAG + "Entering get Supported Color Spaces array length: " + colorSpaces.length);
          } catch (error) {
            console.error("The getSupportedColorSpaces call failed. error code: "+error.code);
            expect().assertFail();
          }
          await stopCameraSession();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0100
     * @tc.desc   Check camera session set color sapace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0100 start for camera[" + i + "]");
          
          await startCameraSession(i);
          if (mCameraSession!.isAutoDeviceSwitchSupported()) {
            try {
              let colorSpaces: Array<colorSpaceManager.ColorSpace> = mCameraSession!.getSupportedColorSpaces();
              console.info(TAG + "Entering get Supported Color Spaces type: " + colorSpaces);
              console.info(TAG + "Entering get Supported Color Spaces array length: " + colorSpaces.length);
              if (colorSpaces.length > 0) {
                mCameraSession!.setColorSpace(colorSpaces[0]);
                console.info(TAG + "Entering set Color Space type: " + colorSpaces[0]);
              } else {
                console.info(TAG + "No supported color spaces available for camera[" + i + "]");
              }
            } catch (error) {
              console.error("The getSupportedColorSpaces call failed. error code: "+error.code);
              expect().assertFail();
            }
          }
          await stopCameraSession();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0200
     * @tc.desc   Check camera session get color sapace
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0200 start for camera[" + i + "]");
          
          await startCameraSession(i);
          if (mCameraSession!.isAutoDeviceSwitchSupported()) {
            try {
              let colorSpaces: Array<colorSpaceManager.ColorSpace> = mCameraSession!.getSupportedColorSpaces();
              console.info(TAG + "Entering get Supported Color Spaces type: " + colorSpaces);
              console.info(TAG + "Entering get Supported Color Spaces array length: " + colorSpaces.length);
              if (colorSpaces.length > 0) {
                mCameraSession!.setColorSpace(colorSpaces[0]);
                console.info(TAG + "Entering set Color Space type: " + colorSpaces[0]);
                let activeColorSpace: colorSpaceManager.ColorSpace = mCameraSession!.getActiveColorSpace();
                console.info(TAG + "Entering get Active Color Space type: " + activeColorSpace);
                expect(activeColorSpace == colorSpaces[0]).assertTrue();
              } else {
                console.info(TAG + "No supported color spaces available for camera[" + i + "]");
              }
            } catch (error) {
              console.error("The getSupportedColorSpaces call failed. error code: "+error.code);
              expect().assertFail();
            }
          }
          await stopCameraSession();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_STATIC_0200 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100
     * @tc.desc   Check camera session Auto Device  Switch Supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100 start for camera[" + i + "]");
          await startCameraSession(i);
          let isSupported = false;
          try {
            isSupported = mCameraSession!.isAutoDeviceSwitchSupported();
            console.info(TAG + "Entering Auto Device Switch Supported Bool: " + isSupported);
          } catch (error) {
            console.error("The isAutoDeviceSwitchSupported call failed. error code: "+error.code);
            expect().assertFail();
          }
          await stopCameraSession();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_STATIC_0100 ends here");
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100
     * @tc.desc   Check camera session Enable Auto Device  Switch Supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100 start for camera[" + i + "]");
          await startCameraSession(i);
          let isEnable = true;
          let isSupported = false;
          try {
            isSupported = mCameraSession!.isAutoDeviceSwitchSupported();
            console.info(TAG + "Entering Auto Device Switch Supported Bool: " + isSupported);
            if (!isSupported) {
              console.info(TAG + "Auto Device Switch is not supported for camera[" + i + "]");
              await stopCameraSession();
              continue;
            }
            mCameraSession!.enableAutoDeviceSwitch(isEnable);
          } catch (error) {
            console.error("The enableAutoDeviceSwitch call failed. error code: "+error.code);
            expect().assertFail();
          }
          await stopCameraSession();
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_STATIC_0100 ends here");
        done();
      }
    })
  })
}
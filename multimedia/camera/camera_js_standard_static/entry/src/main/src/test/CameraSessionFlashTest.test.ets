/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import media from '@ohos.multimedia.media'
import fs from '@ohos.file.fs'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import Context from "application.Context";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

const TAG = "CameraSessionFlashTest: ";

let mCameraManager: cameraObj.CameraManager | undefined;
let mCameraDevicesArray: Array<cameraObj.CameraDevice> = [];
let mCameraSession: cameraObj.VideoSession | undefined;
let mVideoRecorder: media.AVRecorder | undefined;
let mCameraInput: cameraObj.CameraInput | undefined;
let mPreviewOutput: cameraObj.PreviewOutput | undefined;
let mPhotoOutput: cameraObj.PhotoOutput | undefined;
let receiver: image.ImageReceiver | undefined;
let AVRecorder: media.AVRecorder;
let mPhotoSurface: string;
let mVideoSurface: string | undefined;
let mFdPath: string;
let mCameraNum: number;
let mHasFlashArray: Array<boolean> = [];
let mIsFlashModeSupportedArray: Array<boolean> = [];

let mVideoProfileCfg: media.AVRecorderProfile = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  audioSampleRate: 48000,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 2000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
};

let mVideoConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: mVideoProfileCfg,
  url: 'file:///data/media/CameraSessionFlashTest.mp4',
};

export default function cameraSessionFlashTest() {

  let fdNumber: int;
  let fdPath: string;
  let surfaceId: string = '';

  let getFd = async (pathName: string) => {
    let fileDir: string = Hypium.get('pathDir') as string;
    pathName = fileDir + '/' + pathName;
    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdNumber = file.fd;
    fdPath = "fd://" + `${fdNumber}`;
    console.info('case getFd number is: ' + fdNumber);
  }

  let closeFd = async () => {
    console.info('case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      console.info('[fs.closeSync] case fdNumber is null');
    }
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

  let getPhotoReceiverSurface = async () => {
    console.log(TAG + 'Entering getPhotoReceiverSurface')
    receiver = image.createImageReceiver({ height: 640, width: 480 }, image.ImageFormat.JPEG, 8)
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

  let releaseVideoReceiveSurface = async () => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await mVideoRecorder!.release()
    await closeFd();

    await Utils.msSleep(100);
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (mCameraManager == undefined) {
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

    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    mHasFlashArray = new Array<boolean>(mCameraNum.toInt());
    mIsFlashModeSupportedArray = new Array<boolean>(mCameraNum.toInt());

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager!.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
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

    mCameraInput = mCameraManager!.createCameraInput(mCameraDevicesArray[idx.toInt()]);

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

    if (mCameraInput != undefined) {
      await mCameraInput!.close();
    }

    console.info('Exit releaseInput');

    return true;
  }

  let createOutput = (idx: int) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()], cameraObj.SceneMode.NORMAL_VIDEO);

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
      /*
      if (!isEmpty(cameraOutputCap.videoProfiles)) {
          console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length);
          for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
              try {
                  mVideoOutput = await mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], mVideoSurface);
                  if (!isEmpty(mVideoOutput)) {
                      break;
                  }
              }
              catch {
                  console.info(TAG + "createVideoOutput FAILED");
              }
          }

          if (isEmpty(mVideoOutput)) {
              console.info(TAG + "createVideoOutput FAILED");
          }

          console.info(TAG + "createVideoOutput: " + mVideoOutput);
      }
      */
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async (): Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (mPreviewOutput != undefined) {
      await mPreviewOutput!.release();
    }

    if (mPhotoOutput != undefined) {
      await mPhotoOutput!.release();
    }
    /*
    if (!isEmpty(mVideoOutput)) {
        await mVideoOutput.stop();
        await mVideoOutput.release();
    }
    */
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
    /*
    if (!isEmpty(mVideoOutput)) {
        console.info(TAG + "Start to addOutput mVideoOutput");
        await mCameraSession.addOutput(mVideoOutput);
    }
    */
    await Utils.msSleep(1);

    await mCameraSession!.commitConfig();

    /*
    await mCameraSession.start(async (err) => {
        console.info(TAG + "Entering mCameraSession start callback");
        if (!err) {
            console.info(TAG + "Entering mCameraSession start PASSED ");
        } else {
            console.info(TAG + "Entering mCameraSession start FAILED : " + err.message);
        }
    })

    await Utils.msSleep(100);
    */
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");

    mCameraSession!.beginConfig();

    /*
    mCameraSession.stop(async (err) => {
        console.info(TAG + "Entering mCameraSession stop callback");
        if (!err) {
            console.info(TAG + "Entering mCameraSession stop PASSED ");
        } else {
            console.info(TAG + "Entering mCameraSession stop FAILED : " + err.message);
        }
    })

    await Utils.msSleep(100);
    */

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

    // await mCameraSession.commitConfig();
    /*
    if (!isEmpty(mVideoOutput)) {
        console.info(TAG + "Start to removeOutput mVideoOutput");
        await mCameraSession.removeOutput(mVideoOutput);
    }
    */
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('cameraSessionFlashTest', () => {
    console.info(TAG + '----------cameraSessionFlashTest--------------')
    beforeAll(() => {
      Utils.msSleep(100);
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await Utils.msSleep(500);

      console.info('beforeAll case');
    })

    beforeEach(() => {
      Utils.msSleep(1000);
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
    })

    afterAll(() => {
      await releaseVideoReceiveSurface();
      await releaseCameraSessionInstance();
      Utils.msSleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100
     * @tc.desc   Check capture session has flash with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100 start for camera[" + i +
            "]");

          await startCameraSession(i);

          let hasFlashPromise = mCameraSession!.hasFlash();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100 finish");
          if (hasFlashPromise != null || hasFlashPromise != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100 PASSED with hasFlash is: " +
              hasFlashPromise);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100 FAILED with hasFlash is: " +
              hasFlashPromise);
            expect().assertFail();
          }
          await Utils.msSleep(100);

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_HAS_FLASH_PROMISE_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session support flash close mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mHasFlashArray.length > mCameraNum) {
            let isFlashModeSupported = mCameraSession!.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_CLOSE);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100 finish");
            if (isFlashModeSupported != null || isFlashModeSupported != undefined) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100 PASSED with isFlashModeSupported is: " +
                isFlashModeSupported);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100 FAILED with isFlashModeSupported is: " +
                isFlashModeSupported);
              expect().assertFail();
            }

            await Utils.msSleep(100);
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100 not support");
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0100 ends here");
        done();
      }

    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100
     * @tc.desc   Check capture session set flash close mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 start for camera[" + i + "]");

          await startCameraSession(i);

          if ((mHasFlashArray.length > mCameraNum) && (mIsFlashModeSupportedArray.length > mCameraNum)) {
            mCameraSession!.setFlashMode(cameraObj.FlashMode.FLASH_MODE_CLOSE);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 PASSED with FlashMode is: " +
            cameraObj.FlashMode.FLASH_MODE_CLOSE);

            let flashMode = mCameraSession!.getFlashMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 finish");
            if (flashMode == cameraObj.FlashMode.FLASH_MODE_CLOSE) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 PASSED with FlaseMode is: " +
                flashMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 FAILED with FlaseMode is: " +
                flashMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 not support");
          }

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200
     * @tc.desc   Check capture session support flash open mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mHasFlashArray.length > mCameraNum) {
            let isFlashModeSupported = mCameraSession!.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_OPEN);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200 finish");
            if (isFlashModeSupported != null || isFlashModeSupported != undefined) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200 PASSED with isFlashModeSupported is: " +
                isFlashModeSupported);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200 FAILED with isFlashModeSupported is: " +
                isFlashModeSupported);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200 not support");
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0200 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200
     * @tc.desc   Check capture session set flash open mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 start for camera[" + i + "]");

          await startCameraSession(i);

          if ((mHasFlashArray.length > mCameraNum) && (mIsFlashModeSupportedArray.length > mCameraNum)) {
            mCameraSession!.setFlashMode(cameraObj.FlashMode.FLASH_MODE_OPEN);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 PASSED with FlashMode is: " +
            cameraObj.FlashMode.FLASH_MODE_OPEN);

            let flashMode = mCameraSession!.getFlashMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 finish");
            if (flashMode == cameraObj.FlashMode.FLASH_MODE_OPEN) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 PASSED with FlaseMode is: " +
                flashMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 FAILED with FlaseMode is: " +
                flashMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 not support");
          }

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0200 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300
     * @tc.desc   Check capture session support flash auto mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mHasFlashArray.length > mCameraNum) {
            let isFlashModeSupported = mCameraSession!.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300 finish");
            if (isFlashModeSupported != null || isFlashModeSupported != undefined) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300 PASSED with isFlashModeSupported is: " +
                isFlashModeSupported);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300 FAILED with isFlashModeSupported is: " +
                isFlashModeSupported);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300 not support");
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0300 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300
     * @tc.desc   Check capture session set flash auto mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 start for camera[" + i + "]");

          await startCameraSession(i);

          if ((mHasFlashArray.length > mCameraNum) && (mIsFlashModeSupportedArray.length > mCameraNum)) {
            mCameraSession!.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 PASSED with FlashMode is: " +
            cameraObj.FlashMode.FLASH_MODE_AUTO);
            let flashMode = mCameraSession!.getFlashMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 finish");
            if (flashMode == cameraObj.FlashMode.FLASH_MODE_AUTO) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 PASSED with FlaseMode is: " +
                flashMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 FAILED with FlaseMode is: " +
                flashMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 not support");
          }
          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0300 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400
     * @tc.desc   Check capture session support flash always open mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mHasFlashArray.length > mCameraNum) {
            let isFlashModeSupported = mCameraSession!.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400 finish");
            if (isFlashModeSupported != null || isFlashModeSupported != undefined) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400 PASSED with hasFlash is: " +
                isFlashModeSupported);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400 FAILED with hasFlash is: " +
                isFlashModeSupported);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400 not support");
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FLASH_MODE_SUPPORT_PROMISE_STATIC_0400 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400
     * @tc.desc   Check capture session set flash always open mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 start for camera[" + i + "]");

          await startCameraSession(i);

          if ((mHasFlashArray.length > mCameraNum) && (mIsFlashModeSupportedArray.length > mCameraNum)) {
            mCameraSession!.setFlashMode(cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 PASSED with FlashMode is: " +
            cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN);
            let flashMode = mCameraSession!.getFlashMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 finish");
            if (flashMode == cameraObj.FlashMode.FLASH_MODE_ALWAYS_OPEN) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 PASSED with FlaseMode is: " +
                flashMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 FAILED with FlaseMode is: " +
                flashMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 not support");
          }

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FLASH_MODE_PROMISE_STATIC_0400 ends here");
        done();
      }
    })
  })
}
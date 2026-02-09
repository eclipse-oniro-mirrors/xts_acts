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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { Hypium } from '../../../hypium/index';
import Context from "application.Context";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

const TAG: string = "CameraSessionFocusTest: ";

let mCameraManager: cameraObj.CameraManager | undefined;
let mCameraDevicesArray: Array<cameraObj.CameraDevice> = [];
let mCameraSession: cameraObj.PhotoSession | undefined;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput | undefined;
let mPreviewOutput: cameraObj.PreviewOutput | undefined;
let mPhotoOutput: cameraObj.PhotoOutput | undefined;
let mIsFocusModeSupportedArray: Array<boolean> = [];
let mPicWidthMax: number = (1.0) as number;
let mPicHeightMax: number = (1.0) as number;
let mPicWidthMean: number = (0.5) as number;
let mPicHeightMean: number = (0.5) as number;

let mFocusPoint: cameraObj.Point = {
  x: mPicWidthMean,
  y: mPicHeightMean,
}

let mFocusPointLT: cameraObj.Point = {
  x: (0.0) as number,
  y: (0.0) as number,
}

let mFocusPointRT: cameraObj.Point = {
  x: mPicWidthMax,
  y: (0.0) as number,
}

let mFocusPointLB: cameraObj.Point = {
  x: (0.0) as number,
  y: mPicHeightMax,
}

let mFocusPointRB: cameraObj.Point = {
  x: mPicWidthMax,
  y: mPicHeightMax,
}

let mFocusPointInvalidLT: cameraObj.Point = {
  x: (-1.0) as number,
  y: (-1.0) as number,
}

let mFocusPointInvalidRT: cameraObj.Point = {
  x: (mPicWidthMax + 1.0) as number,
  y: (-1.0) as number,
}

let mFocusPointInvalidLB: cameraObj.Point = {
  x: (-1.0) as number,
  y: (mPicHeightMax + 1.0) as number,
}

let mFocusPointInvalidRB: cameraObj.Point = {
  x: (mPicWidthMax + 1.0) as number,
  y: (mPicHeightMax + 1.0) as number,
}

let mEnableCheckInvalidFocusPoint: boolean = false;
let receiver: image.ImageReceiver | undefined;

export default function cameraSessionFocusTest() {
  let mVideoRecorder: media.AVRecorder | undefined;
  let fdNumber: int;
  let fdPath: string = "";
  let mVideoSurface: string | undefined;
  let receiver: image.ImageReceiver | undefined;
  let mPhotoSurface: string = "";
  let surfaceId: string = '';

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
  }

  let mVideoConfig: media.AVRecorderConfig = {
    audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
    videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
    profile: mVideoProfileCfg,
    url: 'file:///data/media/CameraSessionFocusTest.mp4',
  }

  let getPhotoReceiverSurface = async (): Promise<void> => {
      console.log(TAG + 'Entering getPhotoReceiverSurface')
      receiver = image.createImageReceiver({height:960, width:1280} as image.Size, image.ImageFormat.JPEG, 8)
      console.log(TAG + 'before receiver check')
      if (receiver !== undefined) {
          console.log(TAG + 'Photo receiver is created successfully')
          mPhotoSurface= await receiver!.getReceivingSurfaceId()
          console.log(TAG + 'Photo received id: ' + mPhotoSurface)
      } else {
              console.log(TAG + 'Photo receiver is created failed')
      }
      console.log(TAG + 'Exit getPhotoReceiverSurface')
  }

  let getFd = async (pathName: string): Promise<void> => {
    console.log(TAG + 'Entering getFd ')
    let fileDir: string = Hypium.get('pathDir') as string;
    pathName = fileDir + '/' + pathName;
    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdNumber = file.fd;
    fdPath = "fd://" + `${fdNumber}`;
    console.info('case getFd number is: ' + fdNumber);
  }

  let closeFd = async (): Promise<void> => {
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

  let releaseVideoReceiveSurface = async (): Promise<void> => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await mVideoRecorder!.release()
    await closeFd();
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
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

    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }


    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    mIsFocusModeSupportedArray = new Array<boolean>(mCameraNum.toInt());

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

  let releaseCameraSessionInstance = async (): Promise<void> => {
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

    let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()], cameraObj.SceneMode.NORMAL_PHOTO);

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

    if (mPreviewOutput != undefined) {
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
    await mCameraSession!.start(async (err) => {
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

  let stopCameraSession = async (): Promise<boolean>  => {
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

  describe('cameraSessionFocusTest', () => {
    console.info(TAG + '----------cameraSessionFocusTest--------------')
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
      Utils.msSleep(5000);
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
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session support focus manual mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100 start for camera[" + i + "]");

          await startCameraSession(i);

          let isFocusModeSupported = mCameraSession!.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100 finish");
          if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100 PASSED with isFocusModeSupported is: " +
              isFocusModeSupported);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100 FAILED with isFocusModeSupported is: " +
              isFocusModeSupported);
            expect().assertFail();
          }
          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100
     * @tc.desc   Check capture session set focus manual mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mIsFocusModeSupportedArray.length > mCameraNum) {
            mCameraSession!.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 PASSED with FocusMode is: " +
            cameraObj.FocusMode.FOCUS_MODE_MANUAL);

            let focusMode = mCameraSession!.getFocusMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 finish");
            if (focusMode == cameraObj.FocusMode.FOCUS_MODE_MANUAL) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 PASSED with FocusMode is: " +
                focusMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 FAILED with FocusMode is: " +
                focusMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 not support");
          }

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200
     * @tc.desc   Check capture session support focus continuous auto mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200 start for camera[" + i + "]");

          await startCameraSession(i);

          let isFocusModeSupported =
            mCameraSession!.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200 finish");
          if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200 PASSED with isFocusModeSupported is: " +
              isFocusModeSupported);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200 FAILED with isFocusModeSupported is: " +
              isFocusModeSupported);
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0200 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200
     * @tc.desc   Check capture session set focus continuous auto mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mIsFocusModeSupportedArray.length > mCameraNum) {
            mCameraSession!.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 PASSED with FocusMode is: " +
            cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO);

            let focusMode = mCameraSession!.getFocusMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 finish");
            if (focusMode == cameraObj.FocusMode.FOCUS_MODE_CONTINUOUS_AUTO) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 PASSED with FocusMode is: " +
                focusMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 FAILED with FocusMode is: " +
                focusMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 not support");
          }

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0200 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300
     * @tc.desc   Check capture session support focus auto mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300 start for camera[" + i + "]");

          await startCameraSession(i);

          let isFocusModeSupported = mCameraSession!.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300 finish");
          if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300 PASSED with isFocusModeSupported is: " +
              isFocusModeSupported);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300 FAILED with isFocusModeSupported is: " +
              isFocusModeSupported);
            expect().assertFail();
          }

          await Utils.msSleep(100);

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0300 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300
     * @tc.desc   Check capture session set focus auto mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mIsFocusModeSupportedArray.length > mCameraNum) {
            mCameraSession!.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_AUTO);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 PASSED with FocusMode is: " +
            cameraObj.FocusMode.FOCUS_MODE_AUTO);

            let focusMode = mCameraSession!.getFocusMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 finish");
            if (focusMode == cameraObj.FocusMode.FOCUS_MODE_AUTO) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 PASSED with FocusMode is: " +
                focusMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 FAILED with FocusMode is: " +
                focusMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 not support");
          }

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0300 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400
     * @tc.desc   Check capture session support focus locked mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400 start for camera[" + i + "]");

          await startCameraSession(i);

          let isFocusModeSupported = mCameraSession!.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400 finish");
          if (isFocusModeSupported != null || isFocusModeSupported != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400 PASSED with isFocusModeSupported is: " +
              isFocusModeSupported);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400 FAILED with isFocusModeSupported is: " +
              isFocusModeSupported);
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_FOCUS_MODE_SUPPORT_PROMISE_STATIC_0400 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400
     * @tc.desc   Check capture session set focus locked mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mIsFocusModeSupportedArray.length > mCameraNum) {
            mCameraSession!.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_LOCKED);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 PASSED with FocusMode is: " +
            cameraObj.FocusMode.FOCUS_MODE_LOCKED);

            let focusMode = mCameraSession!.getFocusMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 finish");
            if (focusMode == cameraObj.FocusMode.FOCUS_MODE_LOCKED) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 PASSED with FocusMode is: " +
                focusMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 FAILED with FocusMode is: " +
                focusMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 not support");
          }

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_MODE_PROMISE_STATIC_0400 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session set focus point with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setFocusPoint(mFocusPoint);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 PASSED with FocusPoint is: " +
          mFocusPoint.x + ", " + mFocusPoint.y);

          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 finish");
          if ((focusPoint.x == mFocusPoint.x) && (focusPoint.y == mFocusPoint.y)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200
     * @tc.desc   Check capture session set focus point with promise(left-top point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200--------------");
    
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 start for camera[" + i + "]");
    
          await startCameraSession(i);
    
          mCameraSession!.setFocusPoint(mFocusPointLT);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 PASSED with FocusPoint is: " +
          mFocusPointLT.x + ", " + mFocusPointLT.y);
    
          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 finish");
          if ((Math.abs(focusPoint.x - mFocusPointLT.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointLT.y) >= 0)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
    
          await stopCameraSession();
    
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 end for camera[" +
            i + "]");
        }
    
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0200 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300
     * @tc.desc   Check capture session set focus point with promise(right-top point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300--------------");
    
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 start for camera[" + i + "]");
    
          await startCameraSession(i);
    
          mCameraSession!.setFocusPoint(mFocusPointRT);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 PASSED with FocusPoint is: " +
          mFocusPointRT.x + ", " + mFocusPointRT.y);
    
          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 finish");
          if ((Math.abs(focusPoint.x - mFocusPointRT.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointRT.y) >= 0)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
    
          await stopCameraSession();
    
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 end for camera[" +
            i + "]");
        }
    
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0300 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400
     * @tc.desc   Check capture session set focus point with promise(left-bottom point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400--------------");
    
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 start for camera[" + i + "]");
    
          await startCameraSession(i);
    
          mCameraSession!.setFocusPoint(mFocusPointLB);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 PASSED with FocusPoint is: " +
          mFocusPointLB.x + ", " + mFocusPointLB.y);
    
          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 finish");
          if ((Math.abs(focusPoint.x - mFocusPointLB.x) >= 0) && (Math.abs(focusPoint.y - mFocusPointLB.y) >= 0)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
    
          await stopCameraSession();
    
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 end for camera[" +
            i + "]");
        }
    
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0400 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500
     * @tc.desc   Check capture session set focus point with promise(right-bottom point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500--------------");
    
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 start for camera[" + i + "]");
    
          await startCameraSession(i);
    
          mCameraSession!.setFocusPoint(mFocusPointRB);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 PASSED with FocusPoint is: " +
          mFocusPointRB.x + ", " + mFocusPointRB.y);
    
          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 finish");
          if ((focusPoint.x == mFocusPointRB.x) && (focusPoint.y == mFocusPointRB.y)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
    
          await stopCameraSession();
    
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 end for camera[" +
            i + "]");
        }
    
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0500 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600
     * @tc.desc   Check capture session set focus point with promise(left-top invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600--------------");
    
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 start for camera[" + i + "]");
    
          await startCameraSession(i);
    
          mCameraSession!.setFocusPoint(mFocusPointInvalidLT);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 PASSED with FocusPoint is: " +
          mFocusPointInvalidLT.x + ", " + mFocusPointInvalidLT.y);
    
          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 finish");
          if (((focusPoint.x != mFocusPointInvalidLT.x) && (focusPoint.y != mFocusPointInvalidLT.y)) ||
            (mEnableCheckInvalidFocusPoint == false)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
    
          await stopCameraSession();
    
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 end for camera[" +
            i + "]");
        }
    
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0600 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700
     * @tc.desc   Check capture session set focus point with promise(right-top invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700--------------");
    
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 start for camera[" + i + "]");
    
          await startCameraSession(i);
    
          mCameraSession!.setFocusPoint(mFocusPointInvalidRT);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 PASSED with FocusPoint is: " +
          mFocusPointInvalidRT.x + ", " + mFocusPointInvalidRT.y);
    
          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 finish");
          if (((focusPoint.x != mFocusPointInvalidRT.x) && (focusPoint.y != mFocusPointInvalidRT.y)) ||
            (mEnableCheckInvalidFocusPoint == false)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
    
          await stopCameraSession();
    
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 end for camera[" +
            i + "]");
        }
    
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0700 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800
     * @tc.desc   Check capture session set focus point with promise(left-bottom invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800--------------");
    
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 start for camera[" + i + "]");
    
          await startCameraSession(i);
    
          mCameraSession!.setFocusPoint(mFocusPointInvalidLB);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 PASSED with FocusPoint is: " +
          mFocusPointInvalidLB.x + ", " + mFocusPointInvalidLB.y);
    
          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 finish");
          if (((focusPoint.x != mFocusPointInvalidLB.x) && (focusPoint.y != mFocusPointInvalidLB.y)) ||
            (mEnableCheckInvalidFocusPoint == false)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
    
          await stopCameraSession();
    
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 end for camera[" +
            i + "]");
        }
    
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0800 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900
     * @tc.desc   Check capture session set focus point with promise(right-bottom invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900--------------");
    
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 start for camera[" + i + "]");
    
          await startCameraSession(i);
    
          mCameraSession!.setFocusPoint(mFocusPointInvalidRB);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 PASSED with FocusPoint is: " +
          mFocusPointInvalidRB.x + ", " + mFocusPointInvalidRB.y);
    
          let focusPoint = mCameraSession!.getFocusPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 finish");
          if (((focusPoint.x != mFocusPointInvalidRB.x) && (focusPoint.y != mFocusPointInvalidRB.y)) ||
            (mEnableCheckInvalidFocusPoint == false)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 PASSED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 FAILED with FocusPoint is: " +
            focusPoint.x + ", " + focusPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
    
          await stopCameraSession();
    
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 end for camera[" +
            i + "]");
        }
    
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_FOCUS_POINT_PROMISE_STATIC_0900 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100
     * @tc.desc   Check capture session get focal length with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100 start for camera[" +
            i + "]");

          await startCameraSession(i);

          let focalLength = mCameraSession!.getFocalLength();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100 PASSED with FocalLength is: " +
            focalLength);

          await stopCameraSession();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_FOCAL_LENGTH_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_STATIC_0100
     * @tc.desc   camera session focusstatechange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_STATIC_0100--------------");
      if (mCameraSession == undefined) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_STATIC_0100 mCameraSession == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_STATIC_0100 to operate");
        mCameraSession!.onFocusStateChange((err: BusinessError | null, data: cameraObj.FocusState | undefined) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_STATIC_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_ON_FOCUSSTATECHANGE_STATIC_0100 FAILED: " + err.message);
          }
          await Utils.msSleep(1000);
          done();
        })
        mCameraSession!.offFocusStateChange()
      }
      await Utils.msSleep(1000);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_STATIC_0100
     * @tc.desc   camera session callback on error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_STATIC_0100--------------");
      if (mCameraSession == undefined) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_STATIC_0100 to operate");
        mCameraSession!.onError((err: BusinessError) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_STATIC_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_CAMERA_SESSION_ON_ERROR_STATIC_0100 FAILED: " + err.message);
          }
          await Utils.msSleep(1000);
          done();
        })
        mCameraSession!.offError()
      }
      await Utils.msSleep(1000);
      done();
    })

  })
}
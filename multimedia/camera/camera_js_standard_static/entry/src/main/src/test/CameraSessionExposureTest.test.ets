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
import { Hypium } from '../../../hypium/index';
import Context from "application.Context";
import Utils  from './Util.test';
import { BusinessError } from '@ohos.base';

const TAG = "CameraSessionExposureTest: ";

let mCameraManager: cameraObj.CameraManager | undefined;
let mCameraDevicesArray: Array<cameraObj.CameraDevice> = [];
let mCameraSession: cameraObj.VideoSession | undefined;
let mVideoRecorder: media.AVRecorder | undefined;
let mVideoSurface: string | undefined;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput | undefined;
let mPreviewOutput: cameraObj.PreviewOutput | undefined;
let mPhotoOutput: cameraObj.PhotoOutput | undefined;
let mVideoOutput: cameraObj.VideoOutput | undefined;
let isVideoOutputCreated: boolean = false;
let mIsExposureModeSupportedArray: Array<boolean> = new Array<boolean>();
let mExposureBiasRangeArray: Array<Array<number>> = new Array<Array<number>>();
let mExposureBiasMaxArray: Array<number> = new Array<number>();
let mExposureBiasMinArray: Array<number> = new Array<number>();

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
  url: 'file:///data/media/CameraSessionExposureTest.mp4',
}

export default function cameraSessionExposureTest() {

  let fdNumber: int = 0;
  let fdPath: string = "";
  let receiver: image.ImageReceiver | undefined;
  let mPhotoSurface: string = "";
  let surfaceId: string = '';

  let mPicWidthMax: number = (1.0) as number;
  let mPicHeightMax: number = (1.0) as number;
  let mPicWidthMean: number = (0.5) as number;
  let mPicHeightMean: number = (0.5) as number;
  let mEnableCheckInvalidMETERINGPoint = false;

  let mMETERINGPoint: cameraObj.Point = {
    x: mPicWidthMean,
    y: mPicHeightMean,
  }

  let mMETERINGPointLT: cameraObj.Point = {
    x: (0.0) as number,
    y: (0.0) as number,
  }

  let mMETERINGPointRT: cameraObj.Point = {
    x: mPicWidthMax,
    y: (0.0) as number,
  }

  let mMETERINGPointLB: cameraObj.Point = {
    x: (0.0) as number,
    y: mPicHeightMax,
  }

  let mMETERINGPointRB: cameraObj.Point = {
    x: mPicWidthMax,
    y: mPicHeightMax,
  }

  let mMETERINGPointInvalidLT: cameraObj.Point = {
    x: (-1.0) as number,
    y: (-1.0) as number,
  }

  let mMETERINGPointInvalidRT: cameraObj.Point = {
    x: (mPicWidthMax + 1) as number,
    y: (-1.0) as number,
  }

  let mMETERINGPointInvalidLB: cameraObj.Point = {
    x: (-1.0) as number,
    y: mPicHeightMax,
  }

  let mMETERINGPointInvalidRB: cameraObj.Point = {
    x: (mPicWidthMax + 1.0) as number,
    y: (mPicHeightMax + 1.0) as number,
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

  let getVideoReceiveSurface = async (): Promise<void> => {
    console.log(TAG + 'Entering getVideoReceiveSurface ')
    await getFd('CameraManager.mp4');
    await Utils.msSleep(2000);
    mVideoConfig.url = fdPath;
    console.log(`getVideoReceiveSurface start createAVRecorder`);
    mVideoRecorder = await media.createAVRecorder();

    if (mVideoRecorder == undefined || mVideoRecorder == null) {
      console.log(`getVideoReceiveSurface mVideoRecorder = undefined`);
    } else {
      console.log(`getVideoReceiveSurface success`);
    }
    console.log(`getVideoReceiveSurface start prepare`);
    await mVideoRecorder!.prepare(mVideoConfig);
    mVideoSurface = await mVideoRecorder!.getInputSurface();

    if (mVideoSurface == undefined) {
      console.log(`getVideoReceiveSurface mVideoSurface = undefined`);
    } else {
      console.log(`getVideoReceiveSurface , mVideoSurface :` + mVideoSurface);
    }
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

    for (let i: int = 0; i < mCameraNum; i++) {
      mIsExposureModeSupportedArray.push(true);
      const a:int = 0;
      const b:int = 0;
      mExposureBiasMaxArray.push(a);
      mExposureBiasMinArray.push(b);
      mExposureBiasRangeArray.push([a,b]);
    }

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('  Enter createCameraSessionInstance');

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

    console.info('  Exit createCameraSessionInstance');

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
    let height:int = 0;
    let width:int = 0;
    let i:int = 0;
    let j:int = 0;
    let k:int = 0;
    let equalFlag:boolean = false;
    let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()], cameraObj.SceneMode.NORMAL_VIDEO);

    if (cameraOutputCap != undefined) {
      if (cameraOutputCap.previewProfiles != null && cameraOutputCap.photoProfiles !=null && cameraOutputCap.videoProfiles != null) {
        for (i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          height = cameraOutputCap.previewProfiles[i].size.height
          width = cameraOutputCap.previewProfiles[i].size.width;
          for (j = 0; j < cameraOutputCap.photoProfiles.length; j++) {
            if (cameraOutputCap.photoProfiles[j].size.height === height &&
              cameraOutputCap.photoProfiles[j].size.width === width) {
              equalFlag = true;
              break;
            }
          }
          if (equalFlag){
            equalFlag = false;
            for (k = 0; k < cameraOutputCap.videoProfiles.length; k++) {
              if (cameraOutputCap.videoProfiles[k].size.height === height &&
                cameraOutputCap.videoProfiles[k].size.width === width) {
                equalFlag = true;
                break;
              }
            }
          }
          if (equalFlag) {
            break;
          }
        }
        if (equalFlag) {
          mPreviewOutput = mCameraManager!.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          if (mPreviewOutput == undefined) {
            console.info(TAG + "createPreviewOutput FAILED");
          }
          console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);

          mPhotoOutput = mCameraManager!.createPhotoOutput(cameraOutputCap.photoProfiles[j]);
          if (mPhotoOutput == undefined) {
            console.info(TAG + "createPhotoOutput FAILED");
          }
          console.info(TAG + "createPhotoOutput is: " + mPhotoOutput);
          mVideoOutput = mCameraManager!.createVideoOutput(cameraOutputCap.videoProfiles[k], mVideoSurface!);
          if (mVideoOutput == null || mVideoOutput == undefined) {
            console.info(TAG + "createVideoOutput FAILED");
          } else {
            isVideoOutputCreated = true;
          }
          console.info(TAG + "createVideoOutput is: " + mVideoOutput);

        } else {
          mPreviewOutput = mCameraManager!.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceId);
          if (mPreviewOutput == undefined) {
            console.info(TAG + "createPreviewOutput FAILED");
          }
          console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);

          mPhotoOutput = mCameraManager!.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
          if (mPhotoOutput == undefined) {
            console.info(TAG + "createPhotoOutput FAILED");
          }
          console.info(TAG + "createPhotoOutput is: " + mPhotoOutput);
          console.info(TAG + "no equal profile  in this device");
        }
      }
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
    if (isVideoOutputCreated == true && mVideoOutput != null && mVideoOutput != undefined) {
        await mVideoOutput!.release();
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
    if (isVideoOutputCreated && mVideoOutput != null && mVideoOutput != undefined) {
        console.info(TAG + "Start to addOutput mVideoOutput");
        mCameraSession!.addOutput(mVideoOutput!);
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
    if (isVideoOutputCreated && mVideoOutput != null && mVideoOutput != undefined) {
        console.info(TAG + "Start to removeOutput mVideoOutput");
        mCameraSession!.removeOutput(mVideoOutput!);
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('cameraSessionExposureTest', () => {
    console.info(TAG + '----------cameraSessionExposureTest--------------')
    beforeAll(async () => {
      try {
        await Utils.msSleep(100);
        getPreviewOutputSurface();
        await getPhotoReceiverSurface();
        await getVideoReceiveSurface();
      } catch (err) {
        console.info(TAG + "  cameraSessionExposureTest beforeAll FAILED: " + err);
      }

      console.info('  cameraSessionExposureTest beforeAll case');
      await Utils.msSleep(1000);
    })

    beforeEach(async () => {
      await Utils.msSleep(1000);
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      console.info('  cameraSessionExposureTest beforeEach case');
    })

    afterEach(async () => {
      await releaseCameraSessionInstance();
      console.info('  cameraSessionExposureTest afterEach case');
    })

    afterAll(async () => {
      await releaseVideoReceiveSurface();
      await releaseCameraSessionInstance();
      await Utils.msSleep(1000);
      console.info('  cameraSessionExposureTest afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session support exposure locked mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100 start for camera[" + i +
            "]");

          await startCameraSession(i);

          let isExposureModeSupported =
            mCameraSession!.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100 finish");
          if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100 PASSED with isExposureModeSupported is: " +
              isExposureModeSupported);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100 FAILED with isExposureModeSupported is: " +
              isExposureModeSupported);
            expect().assertFail();
          }

          try {
            await stopCameraSession();
          } catch (err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100 stopCameraSession FAILED: " + err);
          }
          

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100
     * @tc.desc   Check capture session set exposure locked mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mIsExposureModeSupportedArray.length == mCameraNum) {
            mCameraSession!.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 PASSED with ExposureMode is: " +
            cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED);
            let exposureMode = mCameraSession!.getExposureMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 finish");
            if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_LOCKED) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 PASSED with ExposureMode is: " +
                exposureMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 FAILED with ExposureMode is: " +
                exposureMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 not support");
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200
     * @tc.desc   Check capture session support exposure auto mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200 start for camera[" + i +
            "]");

          await startCameraSession(i);

          let isExposureModeSupported =
            mCameraSession!.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200 finish");
          if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200 PASSED with isExposureModeSupported is: " +
              isExposureModeSupported);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200 FAILED with isExposureModeSupported is: " +
              isExposureModeSupported);
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0200 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200
     * @tc.desc   Check capture session set exposure auto mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 start for camera[" + i + "]");

          await startCameraSession(i);

          if (mIsExposureModeSupportedArray.length == mCameraNum) {
            mCameraSession!.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 PASSED with ExposureMode is: " +
            cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);

            let exposureMode = mCameraSession!.getExposureMode();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 finish");
            if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_AUTO) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 PASSED with ExposureMode is: " +
                exposureMode);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 FAILED with ExposureMode is: " +
                exposureMode);
              expect().assertFail();
            }
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 not support");
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0200 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300
     * @tc.desc   Check capture session support exposure continuous auto mode with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300 start for camera[" + i +
            "]");

          await startCameraSession(i);

          let isExposureModeSupported =
            mCameraSession!.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300 finish");
          if (isExposureModeSupported != null || isExposureModeSupported != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300 PASSED with isExposureModeSupported is: " +
              isExposureModeSupported);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300 FAILED with isExposureModeSupported is: " +
              isExposureModeSupported);
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_IS_EXPOSURE_MODE_SUPPORT_PROMISE_STATIC_0300 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300
     * @tc.desc   Check capture session set exposure continuous auto mode with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 start for camera[" + i +
            "]");

          await startCameraSession(i);

          if (mIsExposureModeSupportedArray.length == mCameraNum) {
            if (mCameraSession!.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO)) {
              mCameraSession!.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 finish");
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 PASSED with ExposureMode is: " +
              cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO);

              let exposureMode = mCameraSession!.getExposureMode();
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 finish");
              if (exposureMode == cameraObj.ExposureMode.EXPOSURE_MODE_CONTINUOUS_AUTO) {
                console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 PASSED with ExposureMode is: " +
                  exposureMode);
              } else {
                console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 FAILED with ExposureMode is: " +
                  exposureMode);
                expect().assertFail();
              }
            }
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 not support");
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 end for camera[" + i +
            "]");
          }
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_MODE_PROMISE_STATIC_0300 ends here");
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100
     * @tc.desc   Check capture session get exposure bias range with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100 start for camera[" + i +
            "]");

          await startCameraSession(i);

          let exposureBiasRange: Array<number> = mCameraSession!.getExposureBiasRange();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100 finish");
          if (exposureBiasRange.length > 0) {
            mExposureBiasRangeArray[i] = exposureBiasRange;
            mExposureBiasMaxArray[i] = exposureBiasRange[exposureBiasRange.length - 1];
            mExposureBiasMinArray[i] = exposureBiasRange[0];
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100 PASSED with ExposureBiasRange length is: " +
            exposureBiasRange.length);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100 FAILED with ExposureBiasRange length is: " +
            exposureBiasRange.length);
            await stopCameraSession();
            expect().assertFail();
          }

          for (let j = 0; j < exposureBiasRange.length; j++) {
            console.info(TAG + j + "th, exposure bias is: " + exposureBiasRange[j]);
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_EXPOSURE_BIAS_RANGE_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100
     * @tc.desc   Check capture session set exposure bias with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 start for camera[" + i + "]");
          let exposureBias: number = mExposureBiasRangeArray[i][0];
          if (exposureBias == 0) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 exposureBias is 0");
          } else {
            await startCameraSession(i);
            mCameraSession!.setExposureBias(exposureBias);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 PASSED with ExposureBias is: " +
            mExposureBiasRangeArray[i][0]);

            let exposureValue = mCameraSession!.getExposureValue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 finish");
            if (exposureValue == mExposureBiasRangeArray[i][0]) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 PASSED with ExposureValue is: " +
                exposureValue);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 FAILED with ExposureValue is: " +
                exposureValue);
              await stopCameraSession();
              expect().assertFail();
            }
            await stopCameraSession();
          }
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200
     * @tc.desc   Check capture session set exposure bias with promise(invalid value, min - 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 start for camera[" + i + "]");
          let exposureBias: number = mExposureBiasMinArray[i];
          if (exposureBias == 0) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 exposureBias is 0");
          } else {
            await startCameraSession(i);
            mCameraSession!.setExposureBias(exposureBias - 1);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 PASSED with ExposureBias is: " +
              (mExposureBiasMinArray[i] - 1));

            let exposureValue = mCameraSession!.getExposureValue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 finish");
            if (exposureValue != (exposureBias - 1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 PASSED with ExposureValue is: " +
                exposureValue);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 FAILED with ExposureValue is: " +
                exposureValue);
              await stopCameraSession();
              expect().assertFail();
            }
            await Utils.msSleep(500);

            await stopCameraSession();
          }
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0200 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300
     * @tc.desc   Check capture session set exposure bias with promise(invalid value, min - 0.1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 start for camera[" + i + "]");
          let exposureBias: number = mExposureBiasMinArray[i];
          if (exposureBias == 0) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 exposureBias is 0");
          } else {
            await startCameraSession(i);
            mCameraSession!.setExposureBias((exposureBias - 0.1) as number);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 PASSED with ExposureBias is: " +
              (mExposureBiasMinArray[i] - 0.1));
            let exposureValue = mCameraSession!.getExposureValue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 finish");
            if (exposureValue != (exposureBias - 0.1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 PASSED with ExposureValue is: " +
                exposureValue);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 FAILED with ExposureValue is: " +
                exposureValue);
              await stopCameraSession();
              expect().assertFail();
            }
            await stopCameraSession();
          }
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0300 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400
     * @tc.desc   Check capture session set exposure bias with promise(invalid value, max + 1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 start for camera[" + i + "]");
          let exposureBias: number = mExposureBiasMaxArray[i];
          if (exposureBias == 0) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 exposureBias is 0");
          } else {
            await startCameraSession(i);

            mCameraSession!.setExposureBias(exposureBias + 1);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 PASSED with ExposureBias is: " +
              (mExposureBiasMaxArray[i] + 1));

            let exposureValue = mCameraSession!.getExposureValue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 finish");
            if (exposureValue != (exposureBias + 1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 PASSED with ExposureValue is: " +
                exposureValue);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 FAILED with ExposureValue is: " +
                exposureValue);
              await stopCameraSession();
              expect().assertFail();
            }

            await stopCameraSession();
          }


          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0400 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500
     * @tc.desc   Check capture session set exposure bias with promise(invalid value, max + 0.1)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 start for camera[" + i + "]");
          let exposureBias: number = mExposureBiasMaxArray[i];
          if (exposureBias == 0) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 exposureBias is 0");
          } else {
            await startCameraSession(i);

            mCameraSession!.setExposureBias((exposureBias + 0.1) as number);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 PASSED with ExposureBias is: " +
              (mExposureBiasMaxArray[i] + 0.1));

            let exposureValue = mCameraSession!.getExposureValue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 finish");
            if (exposureValue != (exposureBias + 0.1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 PASSED with ExposureValue is: " +
                exposureValue);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 FAILED with ExposureValue is: " +
                exposureValue);
              await stopCameraSession();
              expect().assertFail();
            }

            await stopCameraSession();
          }


          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_EXPOSURE_BIAS_PROMISE_STATIC_0500 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session set METERING point with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPoint);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 PASSED with METERINGPoint is: " +
          mMETERINGPoint.x + ", " + mMETERINGPoint.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 finish");
          if ((METERINGPoint.x == mMETERINGPoint.x) && (METERINGPoint.y == mMETERINGPoint.y)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            expect().assertFail();
          }
          await stopCameraSession();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200
     * @tc.desc   Check capture session set METERING point with promise(left-top point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPointLT);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 PASSED with METERINGPoint is: " +
          mMETERINGPointLT.x + ", " + mMETERINGPointLT.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 finish");
          if ((Math.abs(METERINGPoint.x - mMETERINGPointLT.x) >= 0) &&
            (Math.abs(METERINGPoint.y - mMETERINGPointLT.y) >= 0)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0200 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300
     * @tc.desc   Check capture session set METERING point with promise(right-top point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPointRT);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 PASSED with METERINGPoint is: " +
          mMETERINGPointRT.x + ", " + mMETERINGPointRT.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 finish");
          if ((Math.abs(METERINGPoint.x - mMETERINGPointRT.x) >= 0) &&
            (Math.abs(METERINGPoint.y - mMETERINGPointRT.y) >= 0)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0300 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400
     * @tc.desc   Check capture session set METERING point with promise(left-bottom point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPointLB);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 PASSED with METERINGPoint is: " +
          mMETERINGPointLB.x + ", " + mMETERINGPointRB.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 finish");
          if ((Math.abs(METERINGPoint.x - mMETERINGPointLB.x) >= 0) &&
            (Math.abs(METERINGPoint.y - mMETERINGPointLB.y) >= 0)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0400 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500
     * @tc.desc   Check capture session set METERING point with promise(right-bottom point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPointRB);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 PASSED with METERINGPoint is: " +
          mMETERINGPointRB.x + ", " + mMETERINGPointRB.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 finish");
          if ((METERINGPoint.x == mMETERINGPointRB.x) && (METERINGPoint.y == mMETERINGPointRB.y)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }
          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0500 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600
     * @tc.desc   Check capture session set METERING point with promise(left-top invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPointInvalidLT);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 PASSED with METERINGPoint is: " +
          mMETERINGPointInvalidLT.x + ", " + mMETERINGPointInvalidLT.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 finish");
          if (((METERINGPoint.x != mMETERINGPointInvalidLT.x) && (METERINGPoint.y != mMETERINGPointInvalidLT.y)) ||
            (mEnableCheckInvalidMETERINGPoint == false)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0600 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700
     * @tc.desc   Check capture session set METERING point with promise(right-top invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPointInvalidRT);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 PASSED with METERINGPoint is: " +
          mMETERINGPointInvalidRT.x + ", " + mMETERINGPointInvalidRT.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 finish");
          if (((METERINGPoint.x != mMETERINGPointInvalidRT.x) && (METERINGPoint.y != mMETERINGPointInvalidRT.y)) ||
            (mEnableCheckInvalidMETERINGPoint == false)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0700 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800
     * @tc.desc   Check capture session set METERING point with promise(left-bottom invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPointInvalidLB);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 PASSED with METERINGPoint is: " +
          mMETERINGPointInvalidLB.x + ", " + mMETERINGPointInvalidRB.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 finish");
          if (((METERINGPoint.x != mMETERINGPointInvalidLB.x) && (METERINGPoint.y != mMETERINGPointInvalidLB.y)) ||
            (mEnableCheckInvalidMETERINGPoint == false)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0800 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900
     * @tc.desc   Check capture session set METERING point with promise(right-bottom invalid point)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 start for camera[" + i + "]");

          await startCameraSession(i);

          mCameraSession!.setMeteringPoint(mMETERINGPointInvalidRB);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 finish");
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 PASSED with METERINGPoint is: " +
          mMETERINGPointInvalidRB.x + ", " + mMETERINGPointInvalidRB.y);

          let METERINGPoint = mCameraSession!.getMeteringPoint();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 finish");
          if (((METERINGPoint.x != mMETERINGPointInvalidRB.x) && (METERINGPoint.y != mMETERINGPointInvalidRB.y)) ||
            (mEnableCheckInvalidMETERINGPoint == false)) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 PASSED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 FAILED with METERINGPoint is: " +
            METERINGPoint.x + ", " + METERINGPoint.y);
            await stopCameraSession();
            expect().assertFail();
          }

          await stopCameraSession();

          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 end for camera[" + i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_METERING_POINT_PROMISE_STATIC_0900 ends here");
        done();
      }
    })
  })
}
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
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import Context from "application.Context";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

const TAG = "CameraMirrorTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.VideoSession;
let mPhotoSurface: string;
let mVideoRecorder: media.AVRecorder | undefined;
let mVideoSurface: string | undefined;
let mFdPath: string;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;
let mIsMirrorSupportedArray: Array<boolean>;
let isMirrorSupport: boolean;
let context = Hypium.get("Context") as Context;

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
  fileGenerationMode: media.FileGenerationMode.AUTO_CREATE_CAMERA_SCENE,
  url: 'file:///data/media/CameraMirrorTest.mp4',
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;
let receiver: image.ImageReceiver | undefined;

export default function cameraMirrorTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let fdNumber: int;
  let fdPath: string = '';
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
    receiver = image.createImageReceiver({height:960, width:1280} as image.Size, image.ImageFormat.JPEG, 8)
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

    mCameraDevicesArray = mCameraManager.getSupportedCameras();
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
    if (mCameraDevicesArray == null) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    mIsMirrorSupportedArray = new Array<boolean>(mCameraNum.toInt());

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
    } catch(err) {
      console.info('createCaptureSession FAILED');
    }

    if (mCameraSession == undefined) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }

    mCameraSession.beginConfig();

    console.info('Exit createCameraSessionInstance');

    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession.release();
  }

  let createInput = async (idx: int) : Promise<boolean> => {
    console.info('Enter createInput');

    if (mCameraDevicesArray == null) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx.toInt()]);

    if (mCameraInput ==undefined) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }

    await mCameraInput.open();

    await Utils.msSleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async () : Promise<boolean> => {
    console.info('Enter releaseInput');

    if (mCameraInput != undefined) {
      await mCameraInput.close();
    }

    console.info('Exit releaseInput');

    return true;
  }

  let createOutput = (idx: int) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()], cameraObj.SceneMode.NORMAL_VIDEO);

    if (cameraOutputCap != undefined) {
      if (cameraOutputCap.previewProfiles != null) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
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
          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
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
      await mPreviewOutput.release();
    }

    if (mPhotoOutput != undefined) {
      await mPhotoOutput.release();
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
      mCameraSession.addInput(mCameraInput);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to addOutput mPhotoOutput");
      mCameraSession.addOutput(mPhotoOutput);
    }
    /*
    if (!isEmpty(mVideoOutput)) {
        console.info(TAG + "Start to addOutput mVideoOutput");
        await mCameraSession.addOutput(mVideoOutput);
    }
    */
    await Utils.msSleep(1);

    await mCameraSession.commitConfig();

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

  let stopCameraSession = async (): Promise<boolean>=> {
    console.info(TAG + "Enter stopCameraSession");

    mCameraSession.beginConfig();
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
      mCameraSession.removeInput(mCameraInput);
    }

    if (mPreviewOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession.removeOutput(mPreviewOutput);
    }

    if (mPhotoOutput != undefined) {
      console.info(TAG + "Start to removeOutput mPhotoOutput");
      mCameraSession.removeOutput(mPhotoOutput);
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

  describe('CameraMirrorTest', () => {
    console.info(TAG + '----------CameraMirrorTest--------------')
    console.info(TAG + ' CameraMirrorTest-----')
    beforeAll(() => {
      Utils.msSleep(100);
      console.info(TAG + ' CameraMirrorTest beforeAll start')
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      await getVideoReceiveSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();

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
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100
     * @tc.desc   Check photo output is mirror supported with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100 start for camera[" +
            i + "]");

          await startCameraSession(i);

          let isMirrorSupport = mPhotoOutput.isMirrorSupported();
          mIsMirrorSupportedArray[i] = isMirrorSupport;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100 finish");
          if (isMirrorSupport != null || isMirrorSupport != undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100 PASSED with mirrorSupported is: " +
              isMirrorSupport);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100 FAILED with mirrorSupported is: " +
              isMirrorSupport);
            expect().assertFail();
          }

          await Utils.msSleep(1000);
          await stopCameraSession();
          console.info(TAG +
            "Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100 end for camera[" + i + "]");
        }
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100
     * @tc.desc   Check photo output enable mirror with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100--------------");
      let isSupported: boolean = false;
      isSupported = mPhotoOutput.isMovingPhotoSupported()
      if (isSupported == false) {
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100 not Support MovingPhoto');
        done();
      }
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100 start for camera[" +
            i + "]");

          await startCameraSession(i);

          if (mIsMirrorSupportedArray[i] == true) {
            try {
              mPhotoOutput.enableMirror(true);
              console.info(TAG + "Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100 finish");
            } catch (err) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100 FAILED err : " + JSON.stringify(err));
              expect().assertFail();
            }
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100 FAILED with mirror not support");
          }

          await Utils.msSleep(1000);
          await stopCameraSession();
          console.info(TAG +
            "Enter SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100 end for camera[" + i + "]");
        }
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MIRROR_STATIC_0100 ends here");
        done();
      }
    })
  })
}
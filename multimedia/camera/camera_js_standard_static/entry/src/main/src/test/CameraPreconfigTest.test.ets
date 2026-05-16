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
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';
import Context from "application.Context";
import Utils from './Util.test';

const TAG = "CameraPreconfigTest: ";

let mVideoRecorder: media.AVRecorder | undefined;
let mVideoSurface: string | undefined;
let fdNumber: int;
let fdPath: string;
let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.PhotoSession;
let mVideoSession: cameraObj.VideoSession
let mPhotoSurface: string;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mVideoOutput: cameraObj.VideoOutput;
let receiver: image.ImageReceiver | undefined;
let surfaceId: string = '';

export default function cameraPreconfigTest() {

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
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  let createCameraSessionInstance = (sceneMode: cameraObj.SceneMode) => {
    if (sceneMode == cameraObj.SceneMode.NORMAL_PHOTO) {
      mCameraSession = mCameraManager.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO) as cameraObj.PhotoSession;
      if (mCameraSession == undefined) {
        console.info(TAG + "create PhotoSession FAILED");
        return false;
      }
    } else if (sceneMode == cameraObj.SceneMode.NORMAL_VIDEO) {
      mVideoSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO) as cameraObj.VideoSession;
      if (mVideoSession == undefined) {
        console.info(TAG + "create VideoSession FAILED");
        return false;
      }
    } else {
      console.info('createSession FAILED,SceneMode is wrong');
      expect().assertFail();
    }
    console.info('Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    if (mCameraSession != undefined) {
      await mCameraSession!.release();
    }
    
    if (mVideoSession != undefined) {
      await mVideoSession!.release();
    }
  }

  let createInput = async (idx: int): Promise<boolean>  => {
    console.info('Enter createInput');
    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx.toInt()]);
    mCameraInput.open();
    await Utils.msSleep(100);
    console.info(idx + 'th CameraInput is: ' + mCameraInput);
    console.info('Exit createInput');
    return true;
  }

  let releaseInput = async (): Promise<boolean>  => {
    console.info('Enter releaseInput');
    if (mCameraInput != undefined) {
      await mCameraInput!.close();
    }
    console.info('Exit releaseInput');
    return true;
  }

  let createOutput = (sceneMode: cameraObj.SceneMode) => {
    console.info('Enter createOutput');

    if (sceneMode == cameraObj.SceneMode.NORMAL_VIDEO) {
      mVideoOutput = mCameraManager.createVideoOutput(surfaceId);
      if (mVideoOutput ==undefined) {
        console.info(TAG + "createVideoOutput FAILED");
      }
      console.info(TAG + "createVideoOutput: " + mVideoOutput);
    } else {
      mPreviewOutput = mCameraManager.createPreviewOutput(surfaceId);
      if (mPreviewOutput == undefined) {
        console.info(TAG + "createPreviewOutput FAILED");
      }
      console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
    }

    console.info('Exit createOutputs');
    return true;
  }

  let releaseOutput01 = async (): Promise<boolean>  => {
    console.info('Enter releaseOutput01');

    if (mPreviewOutput != undefined) {
      await mPreviewOutput!.release();
    }

    console.info('Exit releaseOutput01');

    return true;
  }

  let releaseOutput02 = async (): Promise<boolean>  => {
    console.info('Enter releaseOutput02');

    if (mVideoOutput != undefined) {
      await mVideoOutput!.release();
    }

    console.info('Exit releaseOutput02');

    return true;
  }
  let startCameraSession = async (idx: int, sceneMode: cameraObj.SceneMode, preconfigType: cameraObj.PreconfigType): Promise<boolean>  => {
    console.info(TAG + "Enter startCameraSession, sceneMode is " + sceneMode);
    if (sceneMode == cameraObj.SceneMode.NORMAL_PHOTO) {
      if (!mCameraSession!.canPreconfig(preconfigType)) {
        console.error(TAG + "Check mCameraSession.canPreconfig fail");
        return false;
      }
      mCameraSession!.preconfig(preconfigType);
      await createInput(idx);
      createOutput(sceneMode);

      await Utils.msSleep(1);

      mCameraSession!.beginConfig();

      if (mCameraInput != undefined) {
        console.info(TAG + "Start to addInput");
        mCameraSession!.addInput(mCameraInput);
      }

      if (mPreviewOutput != undefined) {
        console.info(TAG + "Start to addOutput mPreviewOutput");
        mCameraSession!.addOutput(mPreviewOutput);
      }

      await Utils.msSleep(30);

      await mCameraSession!.commitConfig();

      await Utils.msSleep(50);

      await mCameraSession!.start();

      if (mPreviewOutput != undefined) {
        mPreviewOutput!.getActiveProfile();
      }

    } else if (sceneMode == cameraObj.SceneMode.NORMAL_VIDEO) {
      if (!mVideoSession!.canPreconfig(preconfigType)) {
        console.error(TAG + "Check mVideoSession.canPreconfig fail");
        return false;
      }
      mVideoSession!.preconfig(preconfigType);
      await createInput(idx);
      createOutput(sceneMode);

      await Utils.msSleep(1);

      mVideoSession!.beginConfig();

      if (mCameraInput != undefined) {
        console.info(TAG + "Start to addInput");
        mVideoSession!.addInput(mCameraInput);
      }

      if (mVideoOutput != undefined) {
        console.info(TAG + "Start to addOutput mVideoOutput");
        mVideoSession!.addOutput(mVideoOutput);
      }

      await Utils.msSleep(30);

      await mVideoSession!.commitConfig();

      await Utils.msSleep(50);

      await mVideoSession!.start();
      if (mVideoOutput != undefined) {
        mVideoOutput!.getActiveProfile();
      }
    } else {
      console.info('startCameraSession FAILED,SceneMode is wrong');
      expect().assertFail();
    }
    await Utils.msSleep(100);
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (sceneMode: cameraObj.SceneMode): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession, sceneMode is " + sceneMode);
    if (sceneMode == cameraObj.SceneMode.NORMAL_PHOTO) {
      mCameraSession!.beginConfig();

      await Utils.msSleep(100);
      if (mCameraInput != undefined) {
        console.info(TAG + "Start to removeInput input");
        mCameraSession!.removeInput(mCameraInput);
      }

      if (mPreviewOutput != undefined) {
        console.info(TAG + "Start to removeOutput mPreviewOutput");
        mCameraSession!.removeOutput(mPreviewOutput);
      }
      await mCameraSession!.stop();

      await releaseInput();
      await releaseOutput01();
    } else if (sceneMode == cameraObj.SceneMode.NORMAL_VIDEO) {
      mVideoSession!.beginConfig();

      await Utils.msSleep(100);
      if (mCameraInput != undefined) {
        console.info(TAG + "Start to removeInput input");
        mVideoSession!.removeInput(mCameraInput);
      }

      if (mVideoOutput != undefined) {
        console.info(TAG + "Start to removeOutput mVideoOutput");
        mVideoSession!.removeOutput(mVideoOutput);
      }
      await mVideoSession!.stop();

      await releaseInput();
      await releaseOutput02();
    } else {
      console.info('stopCameraSession FAILED,SceneMode is wrong');
      expect().assertFail();
    }


    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  let mVideoProfile: media.AVRecorderProfile = {
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
    profile: mVideoProfile,
    url: 'file:///data/media/CameraPreconfigTest.mp4',
  }

  let getFd = async (pathName: string) => {
    let fileDir: string = Hypium.get('pathDir') as string;
    pathName = fileDir + '/' + pathName;
    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdNumber = file.fd;
    fdPath = "fd://" + `${fdNumber}`;
    console.info('case getFd number is: ' + fdNumber);
  }

  let getVideoReceiveSurface = async () => {
    await getFd('CameraManager.mp4');
    await Utils.msSleep(2000);
    mVideoConfig.url = fdPath;
    mVideoRecorder = await media.createAVRecorder();

    if (mVideoRecorder == undefined) {
      console.log(`getVideoReceiveSurface mVideoRecorder = undefined`);
    } else {
      await mVideoRecorder!.prepare(mVideoConfig);
      mVideoSurface = await mVideoRecorder!.getInputSurface();

      if (mVideoSurface == undefined) {
        console.log(`getVideoReceiveSurface mVideoSurface = undefined`);
      } else {
        console.log(`getVideoReceiveSurface, mVideoSurface :` + mVideoSurface);
      }
    }
    console.log(`${TAG} getSurfaceId start 4`);
  }

  describe('CameraPreconfigTest', () => {
    console.info(TAG + '----------CameraPreconfigTest--------------')

    beforeAll(() => {
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
    })

    beforeEach(() => {
      await Utils.msSleep(100);
      console.info('beforeEach case');
      await Utils.msSleep(100);
    })

    afterEach(() => {
      console.info('afterEach case');
      await Utils.msSleep(100);
    })

    afterAll(() => {
      try {
        await releaseCameraSessionInstance();
      } catch (error: BusinessError) {
        console.error(TAG + "afterAll err: " + error.code);
      }
      await Utils.msSleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_STATIC_0100
     * @tc.desc   Create photo session
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      }

      let result = createCameraSessionInstance(cameraObj.SceneMode.NORMAL_PHOTO);
      expect(result).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_STATIC_0100 PASSED");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_STATIC_0100
     * @tc.desc   Photo session preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      }

      let result = createCameraSessionInstance(cameraObj.SceneMode.NORMAL_PHOTO);
      expect(result).assertTrue();
      let selectedPreconfigType: cameraObj.PreconfigType;
      let isSelected: boolean = false;
      let types: Array<cameraObj.PreconfigType> = [cameraObj.PreconfigType.PRECONFIG_720P,
        cameraObj.PreconfigType.PRECONFIG_1080P,
        cameraObj.PreconfigType.PRECONFIG_4K,
        cameraObj.PreconfigType.PRECONFIG_HIGH_QUALITY,
      ];
      for (let type of types) {
        if (mCameraSession!.canPreconfig(type)) {
          selectedPreconfigType = type;
          isSelected = true;
          break;
        }
      }
      if (isSelected == false || !mCameraSession!.canPreconfig(selectedPreconfigType)) {
        console.info(TAG + "CameraSession.canPreconfig return fail, skip preconfig interface check");
        done();
      }

      result = await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO, selectedPreconfigType);
      expect(result).assertTrue();
      await stopCameraSession(cameraObj.SceneMode.NORMAL_PHOTO);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHOTO_SESSION_PRECONFIG_STATIC_0100 PASSED");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_STATIC_0100
     * @tc.desc   Video session preconfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      }

      let result = createCameraSessionInstance(cameraObj.SceneMode.NORMAL_VIDEO);
      expect(result).assertTrue();
      let selectedPreconfigType: cameraObj.PreconfigType;
      let isSelected: boolean = false;
      let types: Array<cameraObj.PreconfigType> = [cameraObj.PreconfigType.PRECONFIG_720P,
        cameraObj.PreconfigType.PRECONFIG_1080P,
        cameraObj.PreconfigType.PRECONFIG_4K,
        cameraObj.PreconfigType.PRECONFIG_HIGH_QUALITY,
      ];
      for (let type of types) {
        if (mVideoSession!.canPreconfig(type)) {
          selectedPreconfigType = type;
          isSelected = true;
          break;
        }
      }
      if (isSelected == false || !mVideoSession!.canPreconfig(selectedPreconfigType)) {
        console.info(TAG + "CameraSession.canPreconfig return fail, skip preconfig interface check");
        done();
      }

      result = await startCameraSession(0, cameraObj.SceneMode.NORMAL_VIDEO, selectedPreconfigType);
      expect(result).assertTrue();
      await stopCameraSession(cameraObj.SceneMode.NORMAL_VIDEO);

      console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_PRECONFIG_STATIC_0100 PASSED");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100
     * @tc.desc   test Photo session canpreconfig api with error code 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100--------------");
    //   try {
    //     console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100 SUCCESS");
    //     let canPreconfig = mCameraSession!.canPreconfig(null);
    //     done();
    //   } catch (error) {
    //     let err = error as BusinessError;
    //     console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_CANPRECONFIG_ERROR_CODE_STATIC_0100 ERRORCODE: " + err.code);
    //     expect(err.code).assertEqual('7400101');
    //     done();
    //   }
    //   done();
    // })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100
     * @tc.desc   test Photo session preconfig api with error code 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   console.info("--------------SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100--------------");
    //   try {
    //     console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100 SUCCESS");
    //     mCameraSession!.preconfig(null);
    //     done();
    //   } catch (error) {
    //     let err = error as BusinessError;
    //     console.info(TAG + "SUB_MULTIMEDIA_CREATE_PHTOT_SESSION_PRECONFIG_ERROR_CODE_STATIC_0100 ERRORCODE: " + err.code);
    //     expect(err.code).assertEqual('7400101');
    //     done();
    //   }
    //   done();
    // })
  })
}
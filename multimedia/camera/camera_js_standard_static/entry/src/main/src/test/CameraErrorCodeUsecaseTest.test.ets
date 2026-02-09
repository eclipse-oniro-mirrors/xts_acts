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
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import Context from "application.Context";

// 创建视频录制的参数
let videoProfile: media.AVRecorderProfile = {
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

let videoConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: videoProfile,
  url: 'file:///data/media/CameraErrorCodeUsecaseTest.mp4',
}

let captureLocation: cameraObj.Location = {
  latitude: 0.0,
  longitude: 0.0,
  altitude: 0.0,
}

let captureSetting: cameraObj.PhotoCaptureSetting = {
  quality: cameraObj.QualityLevel.QUALITY_LEVEL_LOW,
  rotation: cameraObj.ImageRotation.ROTATION_0,
  location: captureLocation,
  mirror: false
}

const TAG = "CameraErrorCodeUsecaseTest: ";

let AVRecorder: media.AVRecorder | undefined;
let mCameraManager: cameraObj.CameraManager;
let cameraOutputCap: cameraObj.CameraOutputCapability;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.VideoSession;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoSurface: string= "";
let mPhotoOutput: cameraObj.PhotoOutput;
let videoOutput: cameraObj.VideoOutput;
let videoRecorder: media.AVRecorder | null;
let videoSurfaceId: string | undefined;
let metadataOutput: cameraObj.MetadataOutput;
let mMetadataObjectTypeArray: Array<cameraObj.MetadataObjectType>;
let receiver: image.ImageReceiver | undefined;
let isSessionCreated: boolean = false;
let isCameraInputOpen: boolean = false;

let getPhotoReceiverSurface = async (): Promise<void> => {
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

let isEmpty01 = (data: cameraObj.CameraManager): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty02 = (data: Array<cameraObj.CameraDevice>): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty03 = (data: cameraObj.CameraInput): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty04 = (data: cameraObj.VideoSession): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty05 = (data: cameraObj.CameraOutputCapability): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty06 = (data: Array<cameraObj.Profile>): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty07 = (data: cameraObj.PreviewOutput): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty08 = (data: cameraObj.PhotoOutput): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty09 = (data: Array<cameraObj.MetadataObjectType>): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty10 = (data: cameraObj.CameraInput): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty11 = (data: Array<cameraObj.VideoProfile>): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty12 = (data: cameraObj.VideoOutput): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty13 = (data: cameraObj.MetadataOutput): boolean => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}


export default function cameraErrorCodeUsecaseTest() {

  let getCameraManagerInstance = () => {
    console.info(TAG + 'Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (isEmpty01(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info(TAG + 'Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info(TAG + 'Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }
    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info(TAG + 'Exit getCameraSupportDevicesArray');
    return true;
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info(TAG + 'Enter createInput');
    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
    if (isEmpty03(mCameraInput)) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }
    await mCameraInput.open();
    isCameraInputOpen = true;
    await Utils.msSleep(100);
    console.info(idx + 'th CameraInput is: ' + mCameraInput);
    console.info(TAG + 'Exit createInput');
    return true;
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info(TAG + 'Enter releaseInput');

    if (isCameraInputOpen && !isEmpty03(mCameraInput)) {
      await mCameraInput!.close();
      isCameraInputOpen = false;
    }

    console.info(TAG + 'Exit releaseInput');

    return true;
  }

  let beginCameraSessionConfig = () => {
    console.info(TAG + 'Enter beginCameraSessionConfig');
    mCameraSession.beginConfig();
    console.info(TAG + 'Exit beginCameraSessionConfig');
    return true;
  }

  let commitCameraSessionConfig = async (): Promise<boolean> => {
    console.info(TAG + 'Enter commitCameraSessionConfig');
    await mCameraSession.commitConfig();
    await Utils.msSleep(500);
    console.info(TAG + 'Exit commitCameraSessionConfig');
    return true;
  }

  let createCameraSessionInstance = () => {
    console.info(TAG + 'Enter createCameraSessionInstance');
    try {
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
    } catch(error:BusinessError) {
      console.info(TAG + 'createCaptureSession FAILED');
    }
    if (isEmpty04(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    } else {
      isSessionCreated = true;
    }
    beginCameraSessionConfig();
    console.info(TAG + 'Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async (): Promise<void> => {
    if (isSessionCreated && mCameraSession != undefined) {
      await mCameraSession.release();
      isSessionCreated = false;
    }
  }

  let fdNumber: int;
  let fdPath: string = "";
  let surfaceId: string = '';

  let getFd = async (pathName: string): Promise<void> => {
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

  let getVideoSurface = async (): Promise<void> => {
    await getFd('CameraManager.mp4');
    await Utils.msSleep(2000);
    videoConfig.url = fdPath;
    AVRecorder = await media.createAVRecorder();
    await AVRecorder!.prepare(videoConfig);
    videoSurfaceId = await AVRecorder!.getInputSurface();
    console.log(`${TAG} getSurfaceId start 4`);
  }

  let releaseVideoReceiveSurface = async (): Promise<void> => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await AVRecorder!.release()
    await closeFd();
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
  }

  let createOutput = (idx: int) => {
    console.info(TAG + 'Enter createOutput');
    cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()], cameraObj.SceneMode.NORMAL_VIDEO);
    if (!isEmpty05(cameraOutputCap)) {
      if (!isEmpty06(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          if (!isEmpty07(mPreviewOutput)) {
            break;
          }
        }
        if (isEmpty07(mPreviewOutput)) {
          console.info(TAG + "createPreviewOutput FAILED");
        }
        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }
    }
    if (!isEmpty06(cameraOutputCap.photoProfiles)) {
      console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

      for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
        mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
        if (!isEmpty08(mPhotoOutput)) {
          break;
        }
      }
      if (isEmpty08(mPhotoOutput)) {
        console.info(TAG + "createPhotoOutput FAILED");
      }
      console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
    }
    if (!isEmpty09(cameraOutputCap.supportedMetadataObjectTypes)) {
      mMetadataObjectTypeArray = cameraOutputCap.supportedMetadataObjectTypes;
      if (isEmpty09(mMetadataObjectTypeArray)) {
        console.info(TAG + "mMetadataObjectTypeArray is null");
      } else {
        console.info(TAG + "createMetadataOutput")
        metadataOutput = mCameraManager.createMetadataOutput(mMetadataObjectTypeArray);
      }
    }
    console.info(TAG + 'Exit createOutputs');
    return true;
  }

  describe('CameraErrorCodeUsecaseTest', () => {
    console.info(TAG + '----------CameraErrorCodeUsecaseTest--------------');
    beforeAll(() => {
      console.info(TAG + 'beforeAll case');
    })

    beforeEach(() => {
      await Utils.msSleep(1000);
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
      if (isCameraInputOpen && !isEmpty10(mCameraInput)) {
        await releaseInput();
      }
      if (isSessionCreated && !isEmpty04(mCameraSession)) {
        await releaseCameraSessionInstance();
      }
    })

    afterAll(() => {
      await releaseVideoReceiveSurface();
      console.info('afterAll case');
      if (isCameraInputOpen && !isEmpty10(mCameraInput)) {
        await releaseInput();
      }
      if (isSessionCreated && !isEmpty04(mCameraSession)) {
        await releaseCameraSessionInstance();
      }
      await Utils.msSleep(1000);
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_STATIC_0100
     * @tc.desc   createCameraInput api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_STATIC_0100--------------");
      if (isEmpty01(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_STATIC_0100 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let camerainput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
        } catch (error:BusinessError) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_STATIC_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0200
     * @tc.desc   photoOutput capture api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let captureSettingNull: cameraObj.PhotoCaptureSetting = {}
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        mPhotoOutput.capture(captureSettingNull, (err) => {
          if (!err || err.code == 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0200 success");
            done();
          } else {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0200 FAILED");
            console.info(TAG + "ERRORCODE: " + err.code);
            expect(err!.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
            done();
          }

        })
      } catch(err:BusinessError) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0200 FAILED: " +
            err.message);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0400
     * @tc.desc   photoOutput capture api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0400--------------");
      let captureSettingNull: cameraObj.PhotoCaptureSetting = {}
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        await mPhotoOutput.capture(captureSettingNull);
      } catch (err:BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0400 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0100
     * @tc.desc   commitConfig api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0100--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
      mCameraSession.commitConfig((err: BusinessError | null) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0100 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err!.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0200
     * @tc.desc   commitConfig api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0200--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
      try {
        await mCameraSession.commitConfig()
      } catch(err: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_STATIC_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
      };
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_STATIC_0300
     * @tc.desc   addInput api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_STATIC_0300--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
      try {
        mCameraSession.addInput(mCameraInput);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_STATIC_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_STATIC_0300
     * @tc.desc   removeInput api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_STATIC_0300--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
      try {
        mCameraSession.removeInput(mCameraInput);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_STATIC_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_STATIC_0300
     * @tc.desc   addOutput api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_STATIC_0300--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
      createOutput(0);
      try {
        mCameraSession.addOutput(mPreviewOutput);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_STATIC_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_STATIC_0300
     * @tc.desc   removeOutput api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_STATIC_0300--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
      createOutput(0);
      try {
        mCameraSession.removeOutput(mPreviewOutput);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_STATIC_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        //console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0200 FAILED: " + error.message);
        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0100
     * @tc.desc   capturesession start api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        await mCameraSession.start()
      } catch(err: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
        cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      };
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0200
     * @tc.desc   capturesession start api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      mCameraSession.start((err: BusinessError | null) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0200 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_STATIC_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
          cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
          expect(err!.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_STATIC_0100
     * @tc.desc   capturesession stop api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      mCameraSession.stop((err: BusinessError | null) => {
        if (!err || err.code == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_STATIC_0100 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_STATIC_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
          cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR);
          expect(err!.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        }
      })
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_STATIC_0100 END Here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_STATIC_0100
     * @tc.desc   capturesession hasFlash api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let isFlash: boolean = mCameraSession.hasFlash();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
        cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_STATIC_0100
     * @tc.desc   capturesession isFlashModeSupported api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_STATIC_0100--------------");
        await createInput(0);
        createCameraSessionInstance();
        mCameraSession.addInput(mCameraInput);
        createOutput(0);
        mCameraSession.addOutput(mPreviewOutput);
        mCameraSession.addOutput(mPhotoOutput);
        try {
          let isFlashmodesupported: boolean = mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO);
        } catch (error: BusinessError) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_STATIC_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        ;
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_STATIC_0100
     * @tc.desc   capturesession getFlashMode api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let flashmode: cameraObj.FlashMode = mCameraSession.getFlashMode();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_STATIC_0100
     * @tc.desc   capturesession setFlashMode api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_STATIC_0100
     * @tc.desc   capturesession isExposureModeSupported api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_STATIC_0100--------------");
        await createInput(0);
        createCameraSessionInstance();
        mCameraSession.addInput(mCameraInput);
        createOutput(0);
        mCameraSession.addOutput(mPreviewOutput);
        mCameraSession.addOutput(mPhotoOutput);
        try {
          let issupported: boolean = mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
        } catch (error: BusinessError) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_STATIC_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        ;
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_STATIC_0100
     * @tc.desc   capturesession getExposureMode api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let exposure: cameraObj.ExposureMode = mCameraSession.getExposureMode();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_STATIC_0100
     * @tc.desc   capturesession setExposureMode api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_STATIC_0100
     * @tc.desc   capturesession getMeteringPoint api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let point: cameraObj.Point = mCameraSession.getMeteringPoint();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0100
     * @tc.desc   capturesession setMeteringPoint api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0100 addOutput(mPreviewOutput)");
      mCameraSession.addOutput(mPhotoOutput);
      console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0100 addOutput(mPhotoOutput)");
      try {
        mCameraSession.setMeteringPoint({
          x: (1.0) as number, y: (1.0) as number
        } as cameraObj.Point);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0100 SUCCESS");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0200
     * @tc.desc   capturesession setMeteringPoint api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        mCameraSession.setMeteringPoint({
          x: (-1.0) as number, y: (-1) as number
        } as cameraObj.Point);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_STATIC_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_STATIC_0100
     * @tc.desc   capturesession getExposureBiasRange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_STATIC_0100--------------");
        await createInput(0);
        createCameraSessionInstance();
        mCameraSession.addInput(mCameraInput);
        createOutput(0);
        mCameraSession.addOutput(mPreviewOutput);
        mCameraSession.addOutput(mPhotoOutput);
        try {
          let rangeArray: Array<number> = mCameraSession.getExposureBiasRange();
        } catch (error: BusinessError) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_STATIC_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        ;
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0100
     * @tc.desc   capturesession setExposureBias api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let range: Array<number> = mCameraSession.getExposureBiasRange();
        mCameraSession.setExposureBias(range[0]);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0500
     * @tc.desc   photoOutput capture api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0500--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        await mPhotoOutput.capture();
      } catch (err:BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0500 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0200
     * @tc.desc   capturesession setExposureBias api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        let range: Array<number> = mCameraSession.getExposureBiasRange();
        mCameraSession.setExposureBias(-101);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_STATIC_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_STATIC_0100
     * @tc.desc   capturesession getExposureValue api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let value: number = mCameraSession.getExposureValue();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_STATIC_0100 ERRORCODE");
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_STATIC_0100
     * @tc.desc   capturesession isFocusModeSupported api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_STATIC_0100--------------");
        await createInput(0);
        createCameraSessionInstance();
        mCameraSession.addInput(mCameraInput);
        createOutput(0);
        mCameraSession.addOutput(mPreviewOutput);
        mCameraSession.addOutput(mPhotoOutput);
        try {
          let issupported: boolean = mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
        } catch (error: BusinessError) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_STATIC_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
        ;
        done();
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_STATIC_0100
     * @tc.desc   capturesession getFocusMode api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let focusmode: cameraObj.FocusMode = mCameraSession.getFocusMode();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_STATIC_0100
     * @tc.desc   capturesession setFocusMode api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0100
     * @tc.desc   capturesession setFocusPoint api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setFocusPoint({
          x: (1.0) as number, y: (1.0) as number
        } as cameraObj.Point);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0200
     * @tc.desc   capturesession setFocusPoint api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        mCameraSession.setFocusPoint({
          x: (-1.0) as number, y: (-1.0) as number
        } as cameraObj.Point);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_STATIC_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_STATIC_0100
     * @tc.desc   capturesession getFocusPoint api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_STATIC_0100--------------");
      if (mCameraSession) {
        mCameraSession.release();
        // mCameraSession = null;
      }
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let point: cameraObj.Point = mCameraSession.getFocusPoint();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_STATIC_0100
     * @tc.desc   capturesession getFocalLength api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let length: number = mCameraSession.getFocalLength();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_STATIC_0100
     * @tc.desc   capturesession getZoomRatioRange api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let zoomratiorange: Array<number> = mCameraSession.getZoomRatioRange();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_STATIC_0100
     * @tc.desc   capturesession getZoomRatio api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let zoomratio: number = mCameraSession.getZoomRatio();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0100
     * @tc.desc   capturesession setZoomRatio api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let zoomratiorange: Array<number> = mCameraSession.getZoomRatioRange();
        mCameraSession.setZoomRatio(zoomratiorange[0]);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != null).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0200
     * @tc.desc   capturesession setZoomRatio api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        let zoomratiorange: Array<number> = mCameraSession.getZoomRatioRange();
        mCameraSession.setZoomRatio(-101);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_STATIC_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_STATIC_0100
     * @tc.desc   capturesession isVideoStabilizationModeSupported api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let isVSMS: boolean = mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.LOW);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_STATIC_0100
     * @tc.desc   capturesession getActiveVideoStabilizationMode api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let avstmode: cameraObj.VideoStabilizationMode = mCameraSession.getActiveVideoStabilizationMode();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_STATIC_0100
     * @tc.desc   capturesession setVideoStabilizationMode api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.LOW);
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0100
     * @tc.desc   videooutput  start api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getVideoSurface();
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      if (!isEmpty11(cameraOutputCap.videoProfiles)) {
        for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
          videoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], videoSurfaceId!);
          if (!isEmpty12(videoOutput)) {
            break;
          }
        }
      }
      mCameraSession.addOutput(mPreviewOutput);
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0100 mPreviewOutput");
      if (!isEmpty12(videoOutput)) {
        mCameraSession.addOutput(videoOutput);
        videoOutput.start((err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0100 success");
          } else {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0100 FAILED");
            console.info(TAG + "ERRORCODE: " + err.code);
            expect(err!.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          }
        })
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0200
     * @tc.desc   videooutput  start api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0200--------------");
      await getVideoSurface();
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      if (!isEmpty11(cameraOutputCap.videoProfiles)) {
        for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
          videoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], videoSurfaceId!);
          if (!isEmpty12(videoOutput)) {
            break;
          }
        }
      }
      if (!isEmpty12(videoOutput)) {
        mCameraSession.addOutput(videoOutput);
        try {
          await videoOutput.start()
        } catch(err: BusinessError) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_STATIC_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        };
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0100
     * @tc.desc   MetadataOutput start api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      if (isEmpty13(metadataOutput)) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0100 metadataOutput IS NULL");
      } else {
        mCameraSession.addOutput(metadataOutput);
        metadataOutput.start((err) => {
          if (!err || err.code == 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0100 success");
          } else {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0100 FAILED");
            console.info(TAG + "ERRORCODE: " + err.code);
            expect(err!.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          }
        })
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0200
     * @tc.desc   metadataOutput  start api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      if (isEmpty13(metadataOutput)) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0200 metadataOutput IS NULL");
      } else {
        mCameraSession.addOutput(metadataOutput);
        try {
          await metadataOutput.start()
        } catch(err: BusinessError) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_STATIC_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        };
      }
      done();
    })



    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0600
     * @tc.desc   photoOutput capture api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0600--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      mPhotoOutput.capture((err) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0600 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0600 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err!.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0700
     * @tc.desc   photoOutput capture api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0700--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);

      mPhotoOutput.capture(captureSetting, (err) => {
        if (!err || err.code == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0700 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0700 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err!.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0800
     * @tc.desc   photoOutput capture api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0800--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        await mPhotoOutput.capture(captureSetting);
      } catch (err:BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_STATIC_0800 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_STATIC_0100
     * @tc.desc   capturesession beginConfig api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_STATIC_0100--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
      mCameraSession.beginConfig();
      try {
        mCameraSession.beginConfig();
      } catch (error: BusinessError) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_STATIC_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_CONFIG_LOCKED).assertTrue();
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_GETCAMERADEVICES_0100
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_GETCAMERADEVICES_0100
     * @tc.desc   test getCameraDevices api with error code 7400201
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_GETCAMERADEVICES_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_GETCAMERADEVICES_0100--------------");
      if (isEmpty01(mCameraManager)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_GETCAMERADEVICES_0100 mCameraManager == null || undefined");
        expect().assertFail();
        done();
      }
      if (isEmpty02(mCameraDevicesArray)) {
        console.info(TAG + "No cameras available for setup");
        expect().assertFail();
        done();
        return;
      }
      let baseDevice = mCameraDevicesArray[0];
      let validPos = cameraObj.CameraPosition.CAMERA_POSITION_UNSPECIFIED;
      let validTypes = [baseDevice.cameraType];
      let validConn = baseDevice.connectionType;
      try {
        let devices = mCameraManager!.getCameraDevices(validPos, validTypes, validConn);
        expect().assertFail();
      } catch (error: Error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_GETCAMERADEVICES_0100 Invalid Position Code: " + error.code);
        expect(String(error.code)).assertEqual('7400201');
      }
      done();
    })
  })
}
/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

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
  audioSourceType: 1,
  videoSourceType: 0,
  profile: videoProfile,
  url: 'file:///data/media/CameraOutput.mp4',
  location: { latitude: 30, longitude: 130 } as cameraObj.Location,
  rotation: 0
}

let captureLocation: cameraObj.Location = {
  latitude: 0,
  longitude: 0,
  altitude: 0,
}

let captureSetting: cameraObj.PhotoCaptureSetting = {
  quality: cameraObj.QualityLevel.QUALITY_LEVEL_LOW,
  rotation: cameraObj.ImageRotation.ROTATION_0,
  location: captureLocation,
  mirror: false
}

const TAG = "CameraErrorCodeUsecaseTest: ";

let AVRecorder: media.AVRecorder;
let mCameraManager: cameraObj.CameraManager;
let cameraOutputCap: cameraObj.CameraOutputCapability;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.CaptureSession;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoSurface: string;
let mPhotoOutput: cameraObj.PhotoOutput;
let videoOutput: cameraObj.VideoOutput;
let videoRecorder: media.AVRecorder | null;
let videoSurfaceId: string;
let metadataOutput: cameraObj.MetadataOutput;
let mMetadataObjectTypeArray: Array<cameraObj.MetadataObjectType> | undefined;
let receiver: image.ImageReceiver;

let context = getContext();

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

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

export default function CameraErrorCodeUsecaseTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getCameraManagerInstance = () => {
    console.info(TAG + 'Enter getCameraManagerInstance');
    mCameraManager = cameraObj.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    console.info(TAG + 'Exit getCameraManagerInstance');
    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info(TAG + 'Enter getCameraSupportDevicesArray');
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }
    mCameraNum = mCameraDevicesArray.length;
    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);
    console.info(TAG + 'Exit getCameraSupportDevicesArray');
    return true;
  }

  let createInput = async (idx: number) => {
    console.info(TAG + 'Enter createInput');
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }
    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx]);
    if (isEmpty(mCameraInput)) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }
    await mCameraInput.open();
    sleep(100);
    console.info(idx + 'th CameraInput is: ' + mCameraInput);
    console.info(TAG + 'Exit createInput');
    return true;
  }

  let releaseInput = async () => {
    console.info(TAG + 'Enter releaseInput');

    if (!isEmpty(mCameraInput)) {
      await mCameraInput!.close();
      // mCameraInput = null;
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

  let commitCameraSessionConfig = async () => {
    console.info(TAG + 'Enter commitCameraSessionConfig');
    await mCameraSession.commitConfig();
    sleep(500);
    console.info(TAG + 'Exit commitCameraSessionConfig');
    return true;
  }

  let createCameraSessionInstance = () => {
    console.info(TAG + 'Enter createCameraSessionInstance');
    try {
      mCameraSession = mCameraManager.createCaptureSession();
    } catch {
      console.info(TAG + 'createCaptureSession FAILED');
    }
    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }
    beginCameraSessionConfig();
    console.info(TAG + 'Exit createCameraSessionInstance');
    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession.release();
    // mCameraSession = null;
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

  let file: ESObject;
  let fdNumber: number;
  let fdPath: string;

  let getFd = async (pathName: string) => {
    let fileDir: ESObject = await await AppStorage.get('pathDir');
    pathName = fileDir + '/' + pathName;
    file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdNumber = file.fd;
    fdPath = "fd://" + fdNumber.toString();
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

  let getVideoSurface = async () => {
    await getFd('CameraManager.mp4');
    await sleep(2000);
    videoConfig.url = fdPath;
    AVRecorder = await media.createAVRecorder();
    let errs = await AVRecorder.prepare(videoConfig);
    console.log(`${TAG} getSurfaceId start 3 ${JSON.stringify(errs)} `);
    videoSurfaceId = await AVRecorder.getInputSurface();
    console.log(`${TAG} getSurfaceId start 4`);
  }

  let releaseVideoReceiveSurface = async () => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await videoRecorder!.release()
    videoRecorder = null
    await closeFd();
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
  }

  let createOutput = (idx: number) => {
    console.info(TAG + 'Enter createOutput');
    cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);
    if (!isEmpty(cameraOutputCap)) {
      if (!isEmpty(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceIds);
          if (!isEmpty(mPreviewOutput)) {
            break;
          }
        }
        if (isEmpty(mPreviewOutput)) {
          console.info(TAG + "createPreviewOutput FAILED");
        }
        console.info(TAG + "createPreviewOutput: " + mPreviewOutput);
      }
    }
    if (!isEmpty(cameraOutputCap.photoProfiles)) {
      console.info(TAG + "cameraOutputCap.photoProfiles.length: " + cameraOutputCap.photoProfiles.length);

      for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
        mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhotoSurface);
        if (!isEmpty(mPhotoOutput)) {
          break;
        }
      }
      if (isEmpty(mPhotoOutput)) {
        console.info(TAG + "createPhotoOutput FAILED");
      }
      console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
    }
    if (!isEmpty(cameraOutputCap.supportedMetadataObjectTypes)) {
      mMetadataObjectTypeArray = cameraOutputCap.supportedMetadataObjectTypes;
      if (isEmpty(mMetadataObjectTypeArray)) {
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
    let dr = Driver.create();
    console.info(TAG + '----------CameraErrorCodeUsecaseTest--------------');
    beforeAll(async () => {
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info(TAG + 'beforeAll case');
      await ability();
      await sleep(500);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }
    })

    beforeEach(() => {
      sleep(1000);
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
      if (!isEmpty(mCameraInput)) {
        await releaseInput();
      }
      if (!isEmpty(mCameraSession)) {
        await releaseCameraSessionInstance();
      }
    })

    afterAll(async () => {
      await releaseVideoReceiveSurface();
      console.info('afterAll case');
      if (!isEmpty(mCameraInput)) {
        await releaseInput();
      }
      if (!isEmpty(mCameraSession)) {
        await releaseCameraSessionInstance();
      }
      sleep(1000);
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100
     * @tc.name      : createCameraInput api
     * @tc.desc      : createCameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let camerainput = mCameraManager.createCameraInput(mCameraDevicesArray[0]);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200
     * @tc.name      : createCameraInput api
     * @tc.desc      : createCameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let camerainput = mCameraManager.createCameraInput(undefined);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300
     * @tc.name      : createCameraInput api
     * @tc.desc      : createCameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let camerainput = mCameraManager.createCameraInput(null);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0300 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400
     * @tc.name      : createCameraInput api
     * @tc.desc      : createCameraInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let camerainput = mCameraManager.createCameraInput(null);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_CAMERA_INPUT_0400 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100
     * @tc.name      : createPreviewOutput api
     * @tc.desc      : createPreviewOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let previewoutput = mCameraManager.createPreviewOutput(null);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200
     * @tc.name      : createPreviewOutput api
     * @tc.desc      : createPreviewOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let previewoutput = mCameraManager.createPreviewOutput(null, "createoutput");
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PREVIEW_OUTPUT_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100
     * @tc.name      : createPhotoOutput api
     * @tc.desc      : createPhotoOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let photooutput = mCameraManager.createPhotoOutput(null, "createoutput");
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200
     * @tc.name      : createPhotoOutput api
     * @tc.desc      : createPhotoOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let photooutput = mCameraManager.createPhotoOutput(null);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_PHOTO_OUTPUT_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100
     * @tc.name      : createVideoOutput api
     * @tc.desc      : createVideoOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let videooutput = mCameraManager.createVideoOutput(null);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200
     * @tc.name      : createVideoOutput api
     * @tc.desc      : createVideoOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let videooutput = mCameraManager.createVideoOutput(null, "createoutput");
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_VIDEO_OUTPUT_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100
     * @tc.name      : createMetadataOutput api
     * @tc.desc      : createMetadataOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let videooutput = mCameraManager.createMetadataOutput(null);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200
     * @tc.name      : createMetadataOutput api
     * @tc.desc      : createMetadataOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200--------------");
      if (isEmpty(mCameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200 cameraManager == null || undefined")
        expect().assertFail();
        done();
      } else {
        try {
          let metadataoutput = mCameraManager.createMetadataOutput(null);
        } catch (error) {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CREATE_METADATA_OUTPUT_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          expect(true).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0100
     * @tc.name      : addInput api
     * @tc.desc      : addInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0100--------------");
      createCameraSessionInstance();
      try {
        mCameraSession.addInput(null);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0200
     * @tc.name      : addInput api
     * @tc.desc      : addInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0200--------------");
      createCameraSessionInstance();
      try {
        mCameraSession.addInput(mCameraInput);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0100
     * @tc.name      : removeInput api
     * @tc.desc      : removeInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0100--------------");
      createCameraSessionInstance();
      try {
        mCameraSession.removeInput(mCameraInput);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0200
     * @tc.name      : removeInput api
     * @tc.desc      : removeInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0200--------------");
      createCameraSessionInstance();
      try {
        mCameraSession.removeInput(null);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0100
     * @tc.name      : addOutput api
     * @tc.desc      : addOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0100--------------");
      createCameraSessionInstance();
      try {
        mCameraSession.addOutput(mPhotoOutput);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0200
     * @tc.name      : addOutput api
     * @tc.desc      : addOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0200--------------");
      createCameraSessionInstance();
      try {
        mCameraSession.addOutput(null);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0100
     * @tc.name      : removeOutput api
     * @tc.desc      : removeOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0100--------------");
      createCameraSessionInstance();
      try {
        mCameraSession.removeOutput(mPhotoOutput);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0200
     * @tc.name      : removeOutput api
     * @tc.desc      : removeOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0200--------------");
      createCameraSessionInstance();
      try {
        mCameraSession.removeOutput(null);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200
     * @tc.name      : photoOutput capture api
     * @tc.desc      : photoOutput capture api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      mPhotoOutput.capture({}, async (err) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200 success");
          done();
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
          done();
        }

      })
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0400
     * @tc.name      : photoOutput capture api
     * @tc.desc      : photoOutput capture api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0400', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0400--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        await mPhotoOutput.capture({});
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0400 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100
     * @tc.name      : commitConfig api
     * @tc.desc      : commitConfig api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createCaptureSession();
      mCameraSession.commitConfig(async (err: BusinessError) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
          expect(true).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200
     * @tc.name      : commitConfig api
     * @tc.desc      : commitConfig api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createCaptureSession();
      await mCameraSession.commitConfig().then(() => {
        console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200 success :');
      }).catch((err: BusinessError) => {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_COMMITCONFIG_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        expect(true).assertTrue();
      });
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0300
     * @tc.name      : addInput api
     * @tc.desc      : addInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0300', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0300--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createCaptureSession();
      try {
        mCameraSession.addInput(mCameraInput);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_INPUT_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0300
     * @tc.name      : removeInput api
     * @tc.desc      : removeInput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0300', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0300--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createCaptureSession();
      try {
        mCameraSession.removeInput(mCameraInput);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_INPUT_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0300
     * @tc.name      : addOutput api
     * @tc.desc      : addOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0300', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0300--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createCaptureSession();
      createOutput(0);
      try {
        mCameraSession.addOutput(mPreviewOutput);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_ADD_OUTPUT_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300
     * @tc.name      : removeOutput api
     * @tc.desc      : removeOutput api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createCaptureSession();
      createOutput(0);
      try {
        mCameraSession.removeOutput(mPreviewOutput);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_REMOVE_OUTPUT_0300 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100
     * @tc.name      : capturesession start api
     * @tc.desc      : capturesession start api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      mCameraSession.start().then(() => {
        console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100 success :');
      }).catch((err: BusinessError) => {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
        cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      });
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200
     * @tc.name      : capturesession start api
     * @tc.desc      : capturesession start api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      mCameraSession.start(async (err: BusinessError) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_START_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
          cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
          expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100
     * @tc.name      : capturesession stop api
     * @tc.desc      : capturesession stop api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      mCameraSession.stop(async (err: BusinessError) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
          cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR);
          expect(err.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
        }
      })
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_STOP_0100 END Here");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100
     * @tc.name      : capturesession hasFlash api
     * @tc.desc      : capturesession hasFlash api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let isFlash: boolean = mCameraSession.hasFlash();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_HASFLASH_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        console.info(TAG + "cameraObj.CameraErrorCode.SESSION_NOT_CONFIG: " +
        cameraObj.CameraErrorCode.SESSION_NOT_CONFIG);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100
     * @tc.name      : capturesession isFlashModeSupported api
     * @tc.desc      : capturesession isFlashModeSupported api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100', 0,
      async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100--------------");
        await createInput(0);
        createCameraSessionInstance();
        mCameraSession.addInput(mCameraInput);
        createOutput(0);
        mCameraSession.addOutput(mPreviewOutput);
        mCameraSession.addOutput(mPhotoOutput);
        try {
          let isFlashmodesupported: boolean = mCameraSession.isFlashModeSupported(cameraObj.FlashMode.FLASH_MODE_AUTO);
        } catch (error) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFLASHMODESUPPORTED_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          expect(true).assertTrue();
        }
        ;
        done();
      })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100
     * @tc.name      : capturesession getFlashMode api
     * @tc.desc      : capturesession getFlashMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let flashmode: cameraObj.FlashMode = mCameraSession.getFlashMode();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFLASHMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100
     * @tc.name      : capturesession setFlashMode api
     * @tc.desc      : capturesession setFlashMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setFlashMode(cameraObj.FlashMode.FLASH_MODE_AUTO);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0200
     * @tc.name      : capturesession setFlashMode api
     * @tc.desc      : capturesession setFlashMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        mCameraSession.setFlashMode(5);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFLASHMODE_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100
     * @tc.name      : capturesession isExposureModeSupported api
     * @tc.desc      : capturesession isExposureModeSupported api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100', 0,
      async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100--------------");
        await createInput(0);
        createCameraSessionInstance();
        mCameraSession.addInput(mCameraInput);
        createOutput(0);
        mCameraSession.addOutput(mPreviewOutput);
        mCameraSession.addOutput(mPhotoOutput);
        try {
          let issupported: boolean = mCameraSession.isExposureModeSupported(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
        } catch (error) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISEXPOSUREMODESUPPORTED_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          expect(true).assertTrue();
        }
        ;
        done();
      })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100
     * @tc.name      : capturesession getExposureMode api
     * @tc.desc      : capturesession getExposureMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let exposure: cameraObj.ExposureMode = mCameraSession.getExposureMode();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100
     * @tc.name      : capturesession setExposureMode api
     * @tc.desc      : capturesession setExposureMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setExposureMode(cameraObj.ExposureMode.EXPOSURE_MODE_AUTO);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0200
     * @tc.name      : capturesession setExposureMode api
     * @tc.desc      : capturesession setExposureMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        mCameraSession.setExposureMode(5);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREMODE_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100
     * @tc.name      : capturesession getMeteringPoint api
     * @tc.desc      : capturesession getMeteringPoint api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let point: cameraObj.Point = mCameraSession.getMeteringPoint();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETMETERINGPOINT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100
     * @tc.name      : capturesession setMeteringPoint api
     * @tc.desc      : capturesession setMeteringPoint api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setMeteringPoint({
          x: 1, y: 1
        });
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0200
     * @tc.name      : capturesession setMeteringPoint api
     * @tc.desc      : capturesession setMeteringPoint api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0200--------------");
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
          x: -1, y: -1
        });
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETMETERINGPOINT_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100
     * @tc.name      : capturesession getExposureBiasRange api
     * @tc.desc      : capturesession getExposureBiasRange api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100', 0,
      async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100--------------");
        await createInput(0);
        createCameraSessionInstance();
        mCameraSession.addInput(mCameraInput);
        createOutput(0);
        mCameraSession.addOutput(mPreviewOutput);
        mCameraSession.addOutput(mPhotoOutput);
        try {
          let rangeArray: Array<number> = mCameraSession.getExposureBiasRange();
        } catch (error) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREBIASRANGE_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          expect(true).assertTrue();
        }
        ;
        done();
      })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100
     * @tc.name      : capturesession setExposureBias api
     * @tc.desc      : capturesession setExposureBias api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let range: Array<number> = mCameraSession.getExposureBiasRange();
        mCameraSession.setExposureBias(range[0]);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0200
     * @tc.name      : capturesession setExposureBias api
     * @tc.desc      : capturesession setExposureBias api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0200--------------");
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
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETEXPOSUREBIAS_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100
     * @tc.name      : capturesession getExposureValue api
     * @tc.desc      : capturesession getExposureValue api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let value: number = mCameraSession.getExposureValue();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETEXPOSUREVALUE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100
     * @tc.name      : capturesession isFocusModeSupported api
     * @tc.desc      : capturesession isFocusModeSupported api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100', 0,
      async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100--------------");
        await createInput(0);
        createCameraSessionInstance();
        mCameraSession.addInput(mCameraInput);
        createOutput(0);
        mCameraSession.addOutput(mPreviewOutput);
        mCameraSession.addOutput(mPhotoOutput);
        try {
          let issupported: boolean = mCameraSession.isFocusModeSupported(cameraObj.FocusMode.FOCUS_MODE_AUTO);
        } catch (error) {
          console.info(TAG +
            "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISFOCUSMODESUPPORTED_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + error.code);
          expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          expect(true).assertTrue();
        }
        ;
        done();
      })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100
     * @tc.name      : capturesession getFocusMode api
     * @tc.desc      : capturesession getFocusMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let focusmode: cameraObj.FocusMode = mCameraSession.getFocusMode();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100
     * @tc.name      : capturesession setFocusMode api
     * @tc.desc      : capturesession setFocusMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setFocusMode(cameraObj.FocusMode.FOCUS_MODE_MANUAL);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0200
     * @tc.name      : capturesession setFocusMode api
     * @tc.desc      : capturesession setFocusMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        mCameraSession.setFocusMode(5);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSMODE_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100
     * @tc.name      : capturesession setFocusPoint api
     * @tc.desc      : capturesession setFocusPoint api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setFocusPoint({
          x: 1, y: 1
        });
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0200
     * @tc.name      : capturesession setFocusPoint api
     * @tc.desc      : capturesession setFocusPoint api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0200--------------");
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
          x: -1, y: -1
        });
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETFOCUSPOINT_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100
     * @tc.name      : capturesession getFocusPoint api
     * @tc.desc      : capturesession getFocusPoint api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100--------------");
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
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSPOINT_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_0100
     * @tc.name      : capturesession getFocalLength api
     * @tc.desc      : capturesession getFocalLength api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let length: number = mCameraSession.getFocalLength();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETFOCUSLENGTH_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100
     * @tc.name      : capturesession getZoomRatioRange api
     * @tc.desc      : capturesession getZoomRatioRange api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let zoomratiorange: Array<number> = mCameraSession.getZoomRatioRange();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIORANG_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100
     * @tc.name      : capturesession getZoomRatio api
     * @tc.desc      : capturesession getZoomRatio api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let zoomratio: number = mCameraSession.getZoomRatio();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_GETZOOMRATIO_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100
     * @tc.name      : capturesession setZoomRatio api
     * @tc.desc      : capturesession setZoomRatio api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let zoomratiorange: Array<number> = mCameraSession.getZoomRatioRange();
        mCameraSession.setZoomRatio(zoomratiorange[0]);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0200
     * @tc.name      : capturesession setZoomRatio api
     * @tc.desc      : capturesession setZoomRatio api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0200--------------");
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
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETZOOMRATIO_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100
     * @tc.name      : capturesession isVideoStabilizationModeSupported api
     * @tc.desc      : capturesession isVideoStabilizationModeSupported api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let isVSMS: boolean = mCameraSession.isVideoStabilizationModeSupported(cameraObj.VideoStabilizationMode.LOW);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_ISVSMS_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100
     * @tc.name      : capturesession getActiveVideoStabilizationMode api
     * @tc.desc      : capturesession getActiveVideoStabilizationMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        let avstmode: cameraObj.VideoStabilizationMode = mCameraSession.getActiveVideoStabilizationMode();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_AVSTMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100
     * @tc.name      : capturesession setVideoStabilizationMode api
     * @tc.desc      : capturesession setVideoStabilizationMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        mCameraSession.setVideoStabilizationMode(cameraObj.VideoStabilizationMode.LOW);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        expect(true).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0200
     * @tc.name      : capturesession setVideoStabilizationMode api
     * @tc.desc      : capturesession setVideoStabilizationMode api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      await commitCameraSessionConfig();
      await mCameraSession.start();
      try {
        mCameraSession.setVideoStabilizationMode(5);
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_CAPTURESESSION_SETVSTMODE_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code != cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      }
      ;
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100
     * @tc.name      : PreviewOutput  start api
     * @tc.desc      : PreviewOutput  start api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      mPreviewOutput.start(async (err) => {
        if (!err) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0100 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          expect(true).assertTrue();
        }
      })
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200
     * @tc.name      : PreviewOutput  start api
     * @tc.desc      : PreviewOutput  start api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);

      await mPreviewOutput.start().then((result) => {
        console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200 success :' + result);
      }).catch((err: BusinessError) => {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PREVIEW_START_0200 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
      });
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100
     * @tc.name      : videooutput  start api
     * @tc.desc      : videooutput  start api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100', 0, async (done: Function) => {
      await getVideoSurface();
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      if (!isEmpty(cameraOutputCap.videoProfiles)) {
        for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
          videoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], videoSurfaceId);
          if (!isEmpty(videoOutput)) {
            break;
          }
        }
      }
      mCameraSession.addOutput(mPreviewOutput);
      if (!isEmpty(videoOutput)) {
        mCameraSession.addOutput(videoOutput);
        videoOutput.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100 success");
          } else {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0100 FAILED");
            console.info(TAG + "ERRORCODE: " + err.code);
            expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            expect(true).assertTrue();
          }
        })
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200
     * @tc.name      : videooutput  start api
     * @tc.desc      : videooutput  start api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200--------------");
      await getVideoSurface();
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      if (!isEmpty(cameraOutputCap.videoProfiles)) {
        for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
          videoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], videoSurfaceId);
          if (!isEmpty(videoOutput)) {
            break;
          }
        }
      }
      if (!isEmpty(videoOutput)) {
        mCameraSession.addOutput(videoOutput);
        await videoOutput.start().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200 success :' + result);
        }).catch((err: BusinessError) => {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_VIDEO_START_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
        });
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100
     * @tc.name      : MetadataOutput start api
     * @tc.desc      : MetadataOutput start api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100 metadataOutput IS NULL");
      } else {
        mCameraSession.addOutput(metadataOutput);
        metadataOutput.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100 success");
          } else {
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0100 FAILED");
            console.info(TAG + "ERRORCODE: " + err.code);
            expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
            expect(true).assertTrue();
          }
        })
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200
     * @tc.name      : metadataOutput  start api
     * @tc.desc      : metadataOutput  start api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      if (isEmpty(metadataOutput)) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200 metadataOutput IS NULL");
      } else {
        mCameraSession.addOutput(metadataOutput);
        await metadataOutput.start().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200 success :' + result);
        }).catch((err: BusinessError) => {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_METADATAOUTPUT_START_0200 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
          expect(true).assertTrue();
        });
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0500
     * @tc.name      : photoOutput capture api
     * @tc.desc      : photoOutput capture api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0500', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0500--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        await mPhotoOutput.capture();
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0500 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600
     * @tc.name      : photoOutput capture api
     * @tc.desc      : photoOutput capture api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      mPhotoOutput.capture(async (err) => {
        if (!err) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0600 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700
     * @tc.name      : photoOutput capture api
     * @tc.desc      : photoOutput capture api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      mPhotoOutput.capture(captureSetting, async (err) => {
        if (!err) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700 success");
        } else {
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0700 FAILED");
          console.info(TAG + "ERRORCODE: " + err.code);
          expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
        }
        done();
      })
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0800
     * @tc.name      : photoOutput capture api
     * @tc.desc      : photoOutput capture api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0800', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0800--------------");
      await createInput(0);
      createCameraSessionInstance();
      mCameraSession.addInput(mCameraInput);
      createOutput(0);
      mCameraSession.addOutput(mPreviewOutput);
      mCameraSession.addOutput(mPhotoOutput);
      try {
        await mPhotoOutput.capture(captureSetting);
      } catch (err) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_PHOTOOUTPUT_CAPTURE_0800 FAILED");
        console.info(TAG + "ERRORCODE: " + err.code);
        expect(err.code == cameraObj.CameraErrorCode.SESSION_NOT_RUNNING).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_0100
     * @tc.name      : capturesession beginConfig api
     * @tc.desc      : capturesession beginConfig api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_0100--------------");
      await createInput(0);
      mCameraSession = mCameraManager.createCaptureSession();
      mCameraSession.beginConfig();
      try {
        mCameraSession.beginConfig();
      } catch (error) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ERROR_CODE_USECASE_BEGINCONFIG_0100 FAILED");
        console.info(TAG + "ERRORCODE: " + error.code);
        expect(error.code == cameraObj.CameraErrorCode.SESSION_CONFIG_LOCKED).assertTrue();
        expect(true).assertTrue();
      }
      done();
    })
  })
}
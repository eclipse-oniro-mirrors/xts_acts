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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

const TAG = "CameraVideoCodecTypeTest";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.PhotoSession;

let mPhotoSurface: string;
let mVideoRecorder: media.AVRecorder | null;
let mVideoSurface: string;
let mFdPath: string;

let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;
let mVideoOutput: cameraObj.VideoOutput;

let surfaceId: string;
let AVRecorder: media.AVRecorder;

let receiver: image.ImageReceiver;
let context = getContext();
let mIsVideoCodecTypeModeSupportedArray: Array<boolean>;

let mVideoProfileCfg: ESObject = {
  audioBitrate: 48000,
  audioChannels: 2,
  audioCodec: 'audio/mp4a-latm',
  audioSampleRate: 48000,
  durationTime: 1000,
  fileFormat: 'mp4',
  videoBitrate: 2000000,
  videoCodec: 'video/avc',
  videoFrameWidth: 640,
  videoFrameHeight: 480,
  videoFrameRate: 30
}

let mVideoConfig: ESObject = {
  audioSourceType: 1,
  videoSourceType: 0,
  profile: mVideoProfileCfg,
  url: 'file:///data/media/CameraVideoCodecType.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 } as cameraObj.Location,
  maxSize: 100,
  maxDuration: 500
}


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

export default function CameraVideoCodecTypeTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let file: ESObject;
  let fdNumber: number;

  let getFd = async (pathName: string) => {
    let fileDir: ESObject = await await AppStorage.get('pathDir');
    pathName = fileDir + '/' + pathName;

    file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let fileAsset: ESObject = file;
    fdNumber = file.fd;
    let fdPath = "fd://" + fdNumber.toString();
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

  let getVideoReceiveSurface = async () => {
    console.log(TAG + 'Entering getVideoReceiveSurface')
    await getFd('CameraVideoCodecType.mp4');
    mVideoConfig.url = mFdPath;
    media.createAVRecorder((err, recorder) => {
      if (!err) {
        console.info(TAG + 'Entering create video receiver')
        mVideoRecorder = recorder
        console.info(TAG + 'videoRecorder is :' + JSON.stringify(mVideoRecorder))
        console.info(TAG + 'videoRecorder.prepare called.')
        mVideoRecorder.prepare(mVideoConfig, (err) => {
          if (!err) {
            console.info(TAG + 'videoRecorder.prepare success.')
            mVideoRecorder!.getInputSurface((err, id) => {
              console.info(TAG + 'getInputSurface called')
              if (!err) {
                mVideoSurface = id
                console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(mVideoSurface))
              } else {
                console.info(TAG + 'getInputSurface FAILED')
              }
            })
          } else {
            console.info(TAG + 'prepare FAILED')
          }
        })
      } else {
        console.info(TAG + 'createVideoRecorder FAILED')
      }
    })
    console.log(TAG + 'Exit getVideoReceiveSurface')
  }

  let releaseVideoReceiveSurface = async () => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await mVideoRecorder!.release()
    await closeFd();

    await sleep(100);
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');

    mCameraManager = cameraObj.getCameraManager(context);
    if (isEmpty(mCameraManager)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }
    mCameraDevicesArray = mCameraManager.getSupportedCameras();
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

    mIsVideoCodecTypeModeSupportedArray = new Array(mCameraNum);
    console.info('Exit getCameraSupportDevicesArray');
    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
    } catch {
      console.info('createCaptureSession FAILED');
    }

    if (isEmpty(mCameraSession)) {
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

  let createInput = async (idx: number) => {
    console.info('Enter createInput');

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

    await sleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async () => {
    console.info('Enter releaseInput');

    if (!isEmpty(mCameraInput)) {
      await mCameraInput.close();
    }

    console.info('Exit releaseInput');

    return true;
  }

  let createOutput = (idx: number) => {
    console.info('Enter createOutput');

    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);

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
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async () => {
    console.info('Enter releaseOutput');

    if (!isEmpty(mPreviewOutput)) {
      await mPreviewOutput.release();
    }

    if (!isEmpty(mPhotoOutput)) {
      await mPhotoOutput.release();
    }
    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number) => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    await sleep(1);

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      mCameraSession.addOutput(mPreviewOutput);
    }

    if (!isEmpty(mPhotoOutput)) {
      console.info(TAG + "Start to addOutput mPhotoOutput");
      mCameraSession.addOutput(mPhotoOutput);
    }
    await sleep(1);

    await mCameraSession.commitConfig();

    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async () => {
    console.info(TAG + "Enter stopCameraSession");

    mCameraSession.beginConfig();

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to removeInput input");
      await mCameraSession.removeInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      await mCameraSession.removeOutput(mPreviewOutput);
    }

    if (!isEmpty(mPhotoOutput)) {
      console.info(TAG + "Start to removeOutput mPhotoOutput");
      await mCameraSession.removeOutput(mPhotoOutput);
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('CameraVideoCodecTypeTest', () => {
    console.info(TAG + '----------CameraVideoCodecTypeTest--------------')

    beforeAll(async () => {
      let dr = Driver.create();
      sleep(100);
      getCameraManagerInstance();
      createCameraSessionInstance();
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

    beforeEach(() => {
      sleep(5000);
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(() => {
      releaseCameraSessionInstance();
      sleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100
     * @tc.desc   Check capture session get supported moving photo video codec types with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100', Level.LEVEL2,
      async (done: Function) => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100--------------");

        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          for (let i = 0; i < mCameraNum; i++) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100 start for camera[" +
              i + "]");

            await startCameraSession(i);

            let videoCodecTypesArray: Array<number> = await mPhotoOutput.getSupportedMovingPhotoVideoCodecTypes();
            let videoCodecTypesNum: number = videoCodecTypesArray.length;
            if (videoCodecTypesNum != 0) {
              for (let i = 0; i < videoCodecTypesNum; i++) {
                console.info(TAG +
                  "Enter SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100 is: " +
                videoCodecTypesArray[i]);
              }
            } else {
                console.info(TAG +
                    "Enter SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100 FAILED");
                expect().assertFail(); 
            }
            await sleep(1000);
            await stopCameraSession();
            console.info(TAG +
              "Enter SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100 end for camera[" +
              i + "]");
          }
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_SUPPOERTED_MOVING_PHOTO_VIDEO_CODEC_TYPES_0100 ends here");
          done();
        }
      })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100
     * @tc.desc   Check capture session set moving photo video codec type with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100 start for camera[" +
            i + "]");

          await startCameraSession(i);

          try {
            mPhotoOutput.setMovingPhotoVideoCodecType(cameraObj.VideoCodecType.AVC);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100 finish");
          } catch {
            console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100 FAILED with VideoCodecType is: " +
                 cameraObj.VideoCodecType.AVC);
            expect().assertFail();
          }

          await sleep(1000);
          await stopCameraSession();
          console.info(TAG +
            "Enter SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100 end for camera[" + i + "]");
        }
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200
     * @tc.desc   Check capture session set moving photo video codec type with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200 start for camera[" +
            i + "]");

          await startCameraSession(i);

          try {
            mPhotoOutput.setMovingPhotoVideoCodecType(cameraObj.VideoCodecType.HEVC);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200 finish");
          } catch {
            console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200 FAILED with VideoCodecType is: " +
                 cameraObj.VideoCodecType.HEVC);
            expect().assertFail();
          }
          
          await sleep(1000);
          await stopCameraSession();
          console.info(TAG +
            "Enter SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200 end for camera[" + i + "]");
        }
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_MOVING_PHOTO_VIDEO_CODEC_TYPE_0200 ends here");
        done();
      }
    })
  })
}
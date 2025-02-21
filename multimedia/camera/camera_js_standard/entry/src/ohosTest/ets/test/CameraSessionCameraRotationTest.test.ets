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
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { BusinessError } from '@ohos.base';

const TAG = "CameraSessionCameraRotationTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.Session;

let mPhotoSurface: string;
let mVideoRecorder: media.AVRecorder | null;
let mVideoSurface: string;
let AVRecorder: media.AVRecorder;

// CAMERA-0 letiables
let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;
let mVideoOutput: cameraObj.VideoOutput;

let mIsVideoStabilizationModeSupportedArray: Array<number>;

let context = getContext();

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

let receiver: image.ImageReceiver;

export default function CameraSessionCameraRotationTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
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
    await getFd('CameraManager.mp4');
    await sleep(2000);
    videoConfig.url = fdPath;
    AVRecorder = await media.createAVRecorder();
    let errs = await AVRecorder.prepare(videoConfig);
    console.log(`${TAG} getSurfaceId start 3 ${JSON.stringify(errs)} `);
    mVideoSurface = await AVRecorder.getInputSurface();
    console.log(`${TAG} getSurfaceId start 4`);
  }

  let releaseVideoReceiveSurface = async () => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await mVideoRecorder!.release()
    mVideoRecorder = null
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
    await sleep(3000);
    */
    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }


    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    mIsVideoStabilizationModeSupportedArray = new Array(mCameraNum);

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createCameraSessionInstance = (mode: cameraObj.SceneMode) => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession(mode);
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

  let createOutput = async (idx: number, mode: cameraObj.SceneMode) => {
    console.info('Enter createOutput');

    let cameraOutputCap =
      mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx], mode);

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
          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i]);
          if (!isEmpty(mPhotoOutput)) {
            break;
          }
        }

        if (isEmpty(mPhotoOutput)) {
          console.info(TAG + "createPhotoOutput FAILED");
        }

        console.info(TAG + "createPhotoOutput: " + mPhotoOutput);
      }
      if (!isEmpty(cameraOutputCap.videoProfiles)) {
        console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length);
        for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
          try {
            console.info(TAG +
              `createVideoOutput FAILED + ${cameraOutputCap.videoProfiles[i]} + ${mVideoSurface} +${i}`);
            mVideoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], mVideoSurface);
            if (!isEmpty(mVideoOutput)) {
              break;
            }
          } catch {
            console.info(TAG + "createVideoOutput FAILED");
          }
        }

        if (isEmpty(mVideoOutput)) {
          console.info(TAG + "createVideoOutput FAILED");
        }

        console.info(TAG + "createVideoOutput: " + mVideoOutput);
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
    if (!isEmpty(mVideoOutput)) {
      await mVideoOutput.release();
    }
    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: number, mode: cameraObj.SceneMode) => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    await createOutput(idx, mode);

    await sleep(1000);

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to addOutput mPreviewOutput");
      let canAdd: boolean = mCameraSession.canAddOutput(mPreviewOutput);
      if (canAdd) {
        console.info(TAG + "Start to addOutput mPreviewOutput");
        mCameraSession.addOutput(mPreviewOutput);
        console.info(TAG + "End to addOutput mPreviewOutput");
      } else {
        console.info(TAG + "addOutput mPreviewOutput error");
      }
    }

    if (!isEmpty(mPhotoOutput)) {
      let canAdd: boolean = mCameraSession.canAddOutput(mPhotoOutput);
      if (canAdd) {
        console.info(TAG + "C ddOutput mPhotoOutput");
        mCameraSession.addOutput(mPhotoOutput);
        console.info(TAG + "End to addOutput mPhotoOutput");
      } else {
        console.info(TAG + "addOutput mPhotoOutput error");
      }
    }
    if (!isEmpty(mVideoOutput)) {
      let canAdd: boolean = mCameraSession.canAddOutput(mVideoOutput);
      if (canAdd) {
        console.info(TAG + "Start to addOutput mVideoOutput");
        mCameraSession.addOutput(mVideoOutput);
        console.info(TAG + "End to addOutput mVideoOutput");
      } else {
        console.info(TAG + "addOutput mVideoOutput error");
      }
    }
    await sleep(1000);

    mCameraSession.commitConfig();

    /*
    await mCameraSession.start(async (err) => {
        console.info(TAG + "Entering mCameraSession start callback");
        if (!err) {
            console.info(TAG + "Entering mCameraSession start PASSED ");
        } else {
            console.info(TAG + "Entering mCameraSession start FAILED : " + err.message);
        }
    })

    await sleep(100);
    */
    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async () => {
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

    await sleep(100);
    */

    if (!isEmpty(mCameraInput)) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession.removeInput(mCameraInput);
    }

    if (!isEmpty(mPreviewOutput)) {
      console.info(TAG + "Start to removeOutput mPreviewOutput");
      mCameraSession.removeOutput(mPreviewOutput);
    }

    if (!isEmpty(mPhotoOutput)) {
      console.info(TAG + "Start to removeOutput mPhotoOutput");
      mCameraSession.removeOutput(mPhotoOutput);
    }
    if (!isEmpty(mVideoOutput)) {
      console.info(TAG + "Start to removeOutput mVideoOutput");
      mCameraSession.removeOutput(mVideoOutput);
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('cameraSessionCameraRotationTest', () => {
    console.info(TAG + '----------cameraSessionCameraRotationTest--------------')
    let dr = Driver.create();
    beforeAll(async () => {
      sleep(100);
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
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

    afterAll(async () => {
      await releaseVideoReceiveSurface();
      releaseCameraSessionInstance();
      sleep(1000);
      console.info('afterAll case');
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100
     * @tc.name      : Check capture session support photo rotation get success or not
     * @tc.desc      : Check capture session support photo rotation get success or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100', 2, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100--------------");
        createCameraSessionInstance(cameraObj.SceneMode.NORMAL_PHOTO);
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100 start for camera");
          await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO);
          let cameraPhotoRotation = mPhotoOutput.getPhotoRotation(cameraObj.ImageRotation.ROTATION_0);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100 finish");
          if (cameraPhotoRotation == cameraObj.ImageRotation.ROTATION_90 ||
            cameraPhotoRotation == cameraObj.ImageRotation.ROTATION_270) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100 PASSED with cameraPhotoRotation is: " +
              cameraPhotoRotation);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100 FAILED with cameraPhotoRotation is: " +
              cameraPhotoRotation);
            expect().assertFail();
          }
          await stopCameraSession();startCameraSession
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100 end for camera");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100 ends here");
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_0100 error + ${err}+ ${err.code}+ ${err.message}`);
        done();
      }

    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100
     * @tc.name      : Check capture session support video rotation get success or not
     * @tc.desc      : Check capture session support video rotation get success or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100', 2, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100--------------");
        createCameraSessionInstance(cameraObj.SceneMode.NORMAL_VIDEO);
        await getVideoReceiveSurface();
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100 start for camera");
          await startCameraSession(0, cameraObj.SceneMode.NORMAL_VIDEO);
          let cameraVideoRotation = mVideoOutput.getVideoRotation(cameraObj.ImageRotation.ROTATION_0);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100 finish");
          if (cameraVideoRotation == cameraObj.ImageRotation.ROTATION_90 ||
            cameraVideoRotation == cameraObj.ImageRotation.ROTATION_270) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100 PASSED with cameraVideoRotation is: " +
              cameraVideoRotation);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100 FAILED with cameraVideoRotation is: " +
              cameraVideoRotation);
            expect().assertFail();
          }
          await stopCameraSession();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100 end for camera");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100 ends here");
          done();
        }
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_0100 error + ${err}+ ${err.code}+ ${err.message}`);
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100
     * @tc.name      : Check capture session support preview rotation get success or not
     * @tc.desc      : Check capture session support preview rotation get success or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100', 2, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100--------------");
        createCameraSessionInstance(cameraObj.SceneMode.NORMAL_PHOTO);
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100 start for camera");
          await startCameraSession(0, cameraObj.SceneMode.NORMAL_VIDEO);
          let cameraPreviewRotation = mPreviewOutput.getPreviewRotation(cameraObj.ImageRotation.ROTATION_0);
          mPreviewOutput.setPreviewRotation(cameraObj.ImageRotation.ROTATION_0, false);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100 finish");
          if (cameraPreviewRotation == cameraObj.ImageRotation.ROTATION_90 ||
            cameraPreviewRotation == cameraObj.ImageRotation.ROTATION_270) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100 PASSED with cameraPreviewRotation is: " +
              cameraPreviewRotation);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100 FAILED with cameraPreviewRotation is: " +
              cameraPreviewRotation);
            expect().assertFail();
          }
          await stopCameraSession();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100 end for camera");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100 ends here");
          done();
        }
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_0100 error + ${err}+ ${err.code}+ ${err.message}`);
        done();
      }
    })
  })
}
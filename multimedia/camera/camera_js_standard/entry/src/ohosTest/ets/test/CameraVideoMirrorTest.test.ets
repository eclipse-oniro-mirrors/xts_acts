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
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import { BusinessError } from '@ohos.base';

const TAG = "CameraVideoMirrorTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.VideoSession;

let mPhotoSurface: string;
let mVideoRecorder: media.AVRecorder | null;
let mVideoSurface: string;
let mFdPath: string;

// CAMERA-0 letiables
let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;
let mVideoOutput: cameraObj.VideoOutput;

let mIsMirrorSupportedArray: Array<boolean>;
let isMirrorSupport: boolean;

let context = getContext();
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
  url: 'file:///data/media/CameraVideoMirrorTest.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 } as cameraObj.Location,
  maxSize: 100,
  maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;
let receiver: image.ImageReceiver;

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

export default function CameraVideoMirrorTest() {

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let file: ESObject;
  let fdNumber: number;

  let getFd = async (pathName: string) => {
    let fileDir: ESObject = await AppStorage.get('pathDir');
    pathName = fileDir + '/' + pathName;
    file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    let fileAsset: ESObject = file;
    fdNumber = file.fd;
    let fdPath: string = "fd://" + fdNumber.toString();
    console.info('case getFd number is: ' + fdNumber);
    return fdPath;
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
    let size: image.Size = {
      height: 480,
      width: 640
    }
    receiver = image.createImageReceiver(size, image.ImageFormat.JPEG, 8)
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
    mVideoConfig.url = await getFd('CameraManager.mp4');
    console.log(TAG + mVideoConfig.url);
    media.createAVRecorder((err, recorder) => {
      if (!err && !isEmpty(recorder)) {
        console.info(TAG + 'createAVRecorder success');
        mVideoRecorder = recorder;
        console.info(TAG + 'videoRecorder is :' + JSON.stringify(mVideoRecorder));
        mVideoRecorder?.prepare(mVideoConfig, (err) => {
          if (!err) {
            console.info(TAG + 'videoRecorder.prepare success.');
            mVideoRecorder?.getInputSurface((err, id) => {
              if (!err && !isEmpty(id)) {
                console.info(TAG + 'getInputSurface success');
                mVideoSurface = id;
                console.info(TAG + 'getInputSurface surfaceId: ' + JSON.stringify(mVideoSurface));
              } else {
                console.info(TAG + 'getInputSurface FAILED');
              }
            });
          } else {
            console.info(TAG + 'prepare FAILED');
          }
        })
      } else {
        console.info(TAG + 'createVideoRecorder FAILED');
      }
    });
    console.log(TAG + 'Exit getVideoReceiveSurface')
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

    if (isEmpty(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }


    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    mIsMirrorSupportedArray = new Array(mCameraNum);

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

      if (!isEmpty(cameraOutputCap.videoProfiles)) {
          console.info(TAG + "cameraOutputCap.videoProfiles.length: " + cameraOutputCap.videoProfiles.length);
          for (let i = 0; i < cameraOutputCap.videoProfiles.length; i++) {
              try {
                  mVideoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[i], mVideoSurface);
                  if (!isEmpty(mVideoOutput)) {
                      break;
                  }
              }
              catch {
                  console.info(TAG + "createVideoOutput FAILED");
              }
          }

          if (isEmpty(mVideoOutput)) {
            console.info(TAG + "mVideoOutput is Empty");
          } else {
            console.info(TAG + "mVideoOutput success");
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
        await mVideoOutput.stop();
        await mVideoOutput.release();
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

    if (!isEmpty(mVideoOutput)) {
        console.info(TAG + "Start to addOutput mVideoOutput");
        try {
          mCameraSession.addOutput(mVideoOutput);
        } catch (error) {
          let err = error as BusinessError;
          console.error(`The addOutput call failed. error code: ${err.code}`);
        }
    }
    await sleep(1);

    await mCameraSession.commitConfig();


    await mCameraSession.start((err: BusinessError) => {
      if (err) {
        console.error(`Failed to start the session, error code: ${err.code}.`);
      } else {
        console.info('Callback invoked to indicate the session start success.');
      }
    });

    await sleep(100);

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
    /*
    if (!isEmpty(mVideoOutput)) {
        console.info(TAG + "Start to removeOutput mVideoOutput");
        await mCameraSession.removeOutput(mVideoOutput);
    }*/

    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('CameraVideoMirrorTest', () => {
    console.info(TAG + '----------CameraVideoMirrorTest--------------')
    let dr = Driver.create();
    beforeAll(async () => {
      sleep(100);
      for (let i = 0; i < permission.length; i++) {
        power = await dr?.waitForComponent(ON.text('允许', MatchPattern.EQUALS), 500);
        await power?.click();
        power = null;
        await sleep(500);
      }
      await getPhotoReceiverSurface();
      await getVideoReceiveSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await ability();
      await sleep(500);
      console.info('beforeAll case');
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
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_0100
     * @tc.desc   Check whether video output is mirror supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_0100--------------");
      let caseName: string = "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_0100";
      if (mCameraNum == 0) {
        console.info(TAG + caseName + " FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + caseName + " start for camera " + i);
          await startCameraSession(i);
          try {
            console.info(TAG + caseName + "camera " + i + " isMirrorSupported:" + mVideoOutput.isMirrorSupported());
            console.info(TAG + caseName + "camera " + i + " finish");
          } catch (err) {
            console.info(TAG + caseName + "FAILED err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          await sleep(1000);
          await stopCameraSession();
          console.info(TAG + caseName + " end for camera " + i);
        }
        console.info(TAG + caseName + "success");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_0100
     * @tc.desc   Check video output enable mirror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_0100--------------");
      let caseName: string = "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_0100";
      if (mCameraNum == 0) {
        console.info(TAG + caseName + " FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + caseName + " start for camera " + i);
          await startCameraSession(i);
          try {
            if (mVideoOutput.isMirrorSupported() == true) {
              console.info(TAG + caseName + "camera " + i + " mirror support");
              mVideoOutput.enableMirror(true);
              console.info(TAG + caseName + " finish");
            } else {
              console.info(TAG + caseName + "camera " + i + " mirror not support");
            }
          } catch (err) {
            console.info(TAG + caseName + "FAILED err: " + JSON.stringify(err));
            expect().assertFail();
            done();
          }
          await sleep(1000);
          await stopCameraSession();
          console.info(TAG + caseName + " end for camera " + i);
        }
        console.info(TAG + caseName + "success");
        done();
      }
    })

  })
}

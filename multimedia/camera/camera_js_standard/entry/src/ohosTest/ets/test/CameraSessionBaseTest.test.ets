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

import { BusinessError } from '@ohos.base';
import cameraObj from '@ohos.multimedia.camera';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';

const TAG = "CameraSessionBaseTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.VideoSession;

let mPhotoSurface: string;
let mVideoRecorder: media.AVRecorder | null;
let mVideoSurface: string;
let mFdPath: string;

let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;
let mVideoOutput: cameraObj.VideoOutput;

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
  url: 'file:///data/media/CameraSessionBase.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 } as cameraObj.Location,
  maxSize: 100,
  maxDuration: 500
}

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

interface errorVideoProfileType {
  size: cameraObj.Size,
  format: number,
  frameRateRange: cameraObj.FrameRateRange
}

interface errorVideoProfileTypes {
  size: cameraObj.Size,
  format: number
}

export default function cameraSessionTest() {

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
    await getFd('CameraSessionBase.mp4');
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
    mVideoRecorder = null
    await closeFd();
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

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession(cameraObj.SceneMode.NORMAL_VIDEO);
    } catch {
      console.info('createCaptureSession FAILED');
    }

    if (isEmpty(mCameraSession)) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }


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
    /*
    if (!isEmpty(mVideoOutput)) {
        console.info(TAG + "Start to addOutput mVideoOutput");
        await mCameraSession.addOutput(mVideoOutput);
    }
    */
    await sleep(30);

    await mCameraSession.commitConfig();

    await sleep(50);

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

  describe('CameraSessionBaseTest', () => {
    console.info(TAG + '----------CameraSessionTest--------------')
    let dr = Driver.create();
    beforeAll(async () => {
      sleep(100);
      await getPhotoReceiverSurface();
      await getVideoReceiveSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
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

    beforeEach(async () => {
      await sleep(100);
      console.info('beforeEach case');
      await sleep(100);
    })

    afterEach(async () => {
      console.info('afterEach case');
      await sleep(100);
    })

    afterAll(async () => {
      await releaseVideoReceiveSurface();
      releaseCameraSessionInstance();
      sleep(1000);
      console.info('afterAll case');
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_0100
     * @tc.name      : Check capture session begin config
     * @tc.desc      : Check capture session begin config
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        mCameraSession.beginConfig();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_0100 PASSED");
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100
     * @tc.name      : Check capture session add input with promise or not
     * @tc.desc      : Check capture session add input with promise or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 start for camera[" +
            i + "]");

          await createInput(i);
          mCameraSession.addInput(mCameraInput);
          mCameraSession.removeInput(mCameraInput);

          await releaseInput();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 end for camera[" +
            i + "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_0100 ends here");
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_0100
     * @tc.name      : Check capture session can add input with promise
     * @tc.desc      : Check capture session can add input with promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_0100 start for camera[" + i +
            "]");
          await createInput(i);
          let result = mCameraSession.canAddInput(mCameraInput);
          expect(result == true).assertTrue();
          mCameraSession.addInput(mCameraInput);
          mCameraSession.removeInput(mCameraInput);
          await releaseInput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_0100 end for camera[" + i +
            "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_0100 ends here");
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_0100
     * @tc.name      : Check capture session can not add input with promise
     * @tc.desc      : Check capture session can not add input with promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_0100', 3, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_0100 start for camera[" + i + "]");
          await createInput(i);
          let result = mCameraSession.canAddInput(mCameraInput);
          expect(result == true).assertTrue();
          mCameraSession.addInput(mCameraInput);
          result = mCameraSession.canAddInput(mCameraInput);
          expect(result == false).assertTrue();
          mCameraSession.removeInput(mCameraInput);
          await releaseInput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_0100 end for camera[" +
            i + "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_0100 ends here");
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100
     * @tc.name      : Check capture session add output with promise or not for preview
     * @tc.desc      : Check capture session add output with promise or not for preview
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100--------------");

      try {
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          await createInput(0);
          createOutput(0);
          mCameraSession.addInput(mCameraInput);
          mCameraSession.addOutput(mPreviewOutput);
          mCameraSession.addOutput(mPhotoOutput);
          if(mVideoOutput) {
            mCameraSession.addOutput(mVideoOutput);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 add PASSED");
          mCameraSession.removeOutput(mPreviewOutput);
          mCameraSession.removeOutput(mPhotoOutput);
          if(mVideoOutput) {
            mCameraSession.removeOutput(mVideoOutput);
          }
          mCameraSession.removeInput(mCameraInput);
          await releaseInput();
          await releaseOutput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 ends here");
          done();
        }
      } catch (err) {
        console.log(`${TAG} SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_0100 err ${err.code}`)
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100
     * @tc.name      : Check capture session can add output with promise for preview
     * @tc.desc      : Check capture session can add output with promise for preview
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100--------------");
      createCameraSessionInstance();
      mCameraSession.beginConfig();
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          await createInput(0);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start1");
          createOutput(0);
          console.info(`Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start2 + ${mCameraInput} + ${mCameraSession}`);
          let status: boolean = mCameraSession.canAddInput(mCameraInput);
          console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 +${status}`)
          mCameraSession.addInput(mCameraInput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start3");
          let result = mCameraSession.canAddOutput(mPreviewOutput);
          expect(result == true).assertTrue();
          mCameraSession.addOutput(mPreviewOutput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start4");
          let result1 = mCameraSession.canAddOutput(mPhotoOutput);
          expect(result1 == true).assertTrue();
          mCameraSession.addOutput(mPhotoOutput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start5");
          if(mVideoOutput) {
            let result2 = mCameraSession?.canAddOutput(mVideoOutput);
            console.info(TAG +
              `Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start5.5 + ${result} + ${result1} + ${result2}`);
            expect(result2 == true).assertTrue();
            mCameraSession.addOutput(mVideoOutput);
          }


          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 add PASSED");
          mCameraSession.removeOutput(mPreviewOutput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start6");
          mCameraSession.removeOutput(mPhotoOutput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start4");
          if(mVideoOutput) {
            mCameraSession.removeOutput(mVideoOutput);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start8");
          mCameraSession.removeInput(mCameraInput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start9");
          await releaseInput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 start10");
          await releaseOutput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 ends here");
          done();
        } catch (err) {
          console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 err + ${JSON.stringify(err)}`)
          console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 err + ${JSON.stringify(err.message)}`)
          console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_0100 err + ${JSON.stringify(err.code)}`)
        }

      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_CAN_NOT_ADD_OUTPUT_PROMISE_0100
     * @tc.name      : Check capture session can not add output with promise for preview
     * @tc.desc      : Check capture session can not add output with promise for preview
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_NOT_ADD_OUTPUT_PROMISE_0100', 3, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_NOT_ADD_OUTPUT_PROMISE_0100--------------");

      try {
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_NOT_ADD_OUTPUT_PROMISE_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          let errorDefaultProfile: errorVideoProfileTypes = {
            format: 1003,
            size: {
              width: 123,
              height: 456
            } as cameraObj.Size,
          }
          let errorVideoProfile: errorVideoProfileType = {
            format: 1003,
            size: {
              width: 123,
              height: 456
            } as cameraObj.Size,
            frameRateRange: {
              min: 30,
              max: 60
            } as cameraObj.FrameRateRange,
          }
          await createInput(0);
          mCameraSession.addInput(mCameraInput);
          mPreviewOutput = mCameraManager.createPreviewOutput(errorDefaultProfile, surfaceIds);
          let result = mCameraSession.canAddOutput(mPreviewOutput);
          expect(result == false).assertTrue();
          mPhotoOutput = mCameraManager.createPhotoOutput(errorDefaultProfile, mPhotoSurface);
          result = mCameraSession.canAddOutput(mPhotoOutput);
          expect(result == false).assertTrue();
          if(mVideoSurface) {
            mVideoOutput = mCameraManager.createVideoOutput(errorVideoProfile, mVideoSurface);
            result = mCameraSession.canAddOutput(mVideoOutput);
            expect(result == false).assertTrue();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_NOT_ADD_OUTPUT_PROMISE_0100 add PASSED");
          mCameraSession.removeInput(mCameraInput);
          await releaseInput();
          await releaseOutput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_NOT_ADD_OUTPUT_PROMISE_0100 ends here");
          done();
        }
      } catch (err) {
        console.log(`${TAG} SUB_MULTIMEDIA_CAMERA_SESSION_CAN_NOT_ADD_OUTPUT_PROMISE_0100 err ${err.code}`)
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_0100
     * @tc.name      : Check capture session commit config
     * @tc.desc      : Check capture session commit config
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_0100--------------");

      try {
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          await createInput(0);
          createOutput(0);
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
          await mCameraSession.commitConfig();

          await stopCameraSession();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_0100 PASSED");
          done();
        }
      } catch (err) {
        console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_0100 err ${err.code}`)
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_0100
     * @tc.name      : Check capture session release with promise or not
     * @tc.desc      : Check capture session release with promise or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_0100--------------");

      await mCameraSession.release();

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_0100 ends here");
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100
     * @tc.name      : Check capture session start/stop/release output with promise or not
     * @tc.desc      : Check capture session start/stop/release output with promise or not
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100', 0, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        await sleep(5);
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 start for camera[" + i +
            "]");
          createCameraSessionInstance();
          createOutput(i);
          await createInput(i)
          mCameraSession.beginConfig();
          mCameraSession.addInput(mCameraInput);
          mCameraSession.addOutput(mPreviewOutput);
          mCameraSession.addOutput(mPhotoOutput);
          if(mVideoOutput) {
            mCameraSession.addOutput(mVideoOutput);
          }
          await mCameraSession.commitConfig();
          await mCameraSession.start();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 start PASSED");
          await sleep(20);
          await mCameraSession.stop();
          await releaseInput();
          await releaseOutput();
          await mCameraSession.release();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 end for camera[" + i +
            "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_0100 ends here");
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_0100
     * @tc.name      : videosession callback on focusStateChange
     * @tc.desc      : videosession callback on focusStateChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_0100");
        mCameraSession.on('focusStateChange', (err: BusinessError, focusState: cameraObj.FocusState) => {
          if (err !== undefined && err.code !== 0) {
            console.info(TAG + `Callback Error, errorCode: ${err.code}`);
            expect().assertFail();
          }
          console.info(TAG + `Focus state: ${focusState}`);
        })
        mCameraSession.off('focusStateChange');
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_0100 ERRORCODE: " + err.code);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_0100
     * @tc.name      : videosession callback on error
     * @tc.desc      : videosession callback on error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_0100', 2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_0100 SUCCESS");
        mCameraSession.on('error', (err: BusinessError) => {
          if (!err){
            console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_0100 FAILED! error == null || undefined");
            expect().assertFail();
          } else {
            console.info(`Video session error code: ${err.code}`);
          }
        })
        mCameraSession.off('error');
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_0100 ERRORCODE: " + err.code);
        expect().assertFail();
        done();
      }
      done();
    })
  })
}
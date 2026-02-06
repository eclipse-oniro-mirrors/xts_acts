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
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import { surfaceIds } from '../testability/pages/Index';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import colorSpaceManager from '@ohos.graphics.colorSpaceManager';

const TAG = "CameraSessionZoomRatioTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.PhotoSession;

let mPhotoSurface: string;
let mVideoRecorder: media.AVRecorder;
let mVideoSurface: string;
let mFdPath: string;

let mCameraNum: number;

let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;

let mZoomRatioRangeArray: Array<cameraObj.FrameRateRange>;
let mZoomRatioMaxArray: Array<number>;
let mZoomRatioMinArray: Array<number>;

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
  url: 'file:///data/media/CameraSessionZoomRatio.mp4',
  orientationHint: 0,
  location: { latitude: 30, longitude: 130 } as cameraObj.Location,
  maxSize: 100,
  maxDuration: 500
}

let mPicWidthMax = 8192;
let mPicHeightMax = 8192;
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

export default function cameraSessionZoomRatioTest() {

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
    await getFd('CameraSessionZoomRatio.mp4');
    mVideoConfig.url = mFdPath;
    media.createAVRecorder((err, recorder) => {
      if (!err) {
        console.info(TAG + 'Entering create video receiver')
        mVideoRecorder = recorder
        console.info(TAG + 'videoRecorder is :' + JSON.stringify(mVideoRecorder))
        console.info(TAG + 'videoRecorder.prepare called.')
        mVideoRecorder.prepare(mVideoConfig, (err: BusinessError) => {
          if (!err) {
            console.info(TAG + 'videoRecorder.prepare success.')
            mVideoRecorder.getInputSurface((err: BusinessError, id: string) => {
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
    await mVideoRecorder.release()
    // mVideoRecorder = null
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

    mZoomRatioRangeArray = new Array(mCameraNum);
    mZoomRatioMaxArray = new Array(mCameraNum);
    mZoomRatioMinArray = new Array(mCameraNum);

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

  let createOutput = async (idx: number) => {
    console.info('Enter createOutput');

    let cameraOutputCap = await mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx]);

    if (!isEmpty(cameraOutputCap)) {
      if (!isEmpty(cameraOutputCap.previewProfiles)) {
        console.info(TAG + "cameraOutputCap.previewProfiles.length: " + cameraOutputCap.previewProfiles.length);
        for (let i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          mPreviewOutput =
            await mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceIds);
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
          mPhotoOutput = await mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[i], mPhotoSurface);
          if (!isEmpty(mPhotoOutput)) {
            break;
          }
        }

        if (isEmpty(mPhotoOutput)) {
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

  let releaseOutput = async () => {
    console.info('Enter releaseOutput');

    if (!isEmpty(mPreviewOutput)) {
      await mPreviewOutput.release();
    }

    if (!isEmpty(mPhotoOutput)) {
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

  let startCameraSession = async (idx: number) => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    console.info(TAG + "Start to addInput");


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
    await sleep(1);

    await mCameraSession.commitConfig();

    console.info(TAG + "Entering startCameraSession start session begin");

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

  describe('cameraSessionZoomRatioTest', () => {
    console.info(TAG + '----------cameraSessionZoomRatioTest--------------')
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100
     * @tc.name      : Check capture session get zoom ratio range with promise
     * @tc.desc      : Check capture session get zoom ratio range with promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    // it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100', Level.LEVEL2, async (done: Function) => {
    //   console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100--------------");
    //
    //   if (mCameraNum == 0) {
    //     console.info(TAG +
    //       "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 FAILED with NoCamera");
    //     expect().assertFail();
    //     done();
    //   } else {
    //     for (let i = 0; i < mCameraNum; i++) {
    //       console.info(TAG +
    //         "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 start for camera[" + i + "]");
    //
    //       await startCameraSession(i);
    //
    //       try {
    //         let zoomRatioRange = mCameraSession.getZoomRatioRange();
    //         console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 finish");
    //         if (zoomRatioRange.length > 0) {
    //           console.info(TAG +
    //             "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 PASSED with ZoomRatioRange length is: " +
    //           zoomRatioRange.length);
    //         } else {
    //           console.info(TAG +
    //             "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 FAILED with ZoomRatioRange length is: " +
    //           zoomRatioRange.length);
    //           expect().assertFail();
    //         }
    //
    //         for (let j = 0; j < zoomRatioRange.length; j++) {
    //           console.info(TAG + j + "th, zoom ratio is: " + zoomRatioRange[j]);
    //         }
    //       } catch {
    //         console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_CALLBACK_0100 PASSED");
    //       }
    //
    //       await stopCameraSession();
    //
    //       console.info(TAG +
    //         "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 end for camera[" + i + "]");
    //     }
    //
    //     console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_ZOOM_RATIO_RANGE_PROMISE_0100 ends here");
    //     done();
    //   }
    // })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100
     * @tc.name      : Check capture session set zoom ratio with promise
     * @tc.desc      : Check capture session set zoom ratio with promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 start for camera[" + i + "]");

          if (!isEmpty(mZoomRatioRangeArray[i])) {
            await startCameraSession(i);

            mCameraSession.setZoomRatio(mZoomRatioRangeArray[i][0]);
            await sleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 PASSED with ZoomRatio is: " +
            mZoomRatioRangeArray[i][0]);

            let zoomRatio: number = mCameraSession.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 finish");
            if (zoomRatio == mZoomRatioRangeArray[i][0]) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }

            await stopCameraSession();
          }

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0100 ends here");
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200
     * @tc.name      : Check capture session set zoom ratio with promise(invalid value, max + 1)
     * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, max + 1)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 start for camera[" + i + "]");

          if (!isEmpty(mZoomRatioRangeArray[i])) {
            await startCameraSession(i);

            mCameraSession.setZoomRatio((mZoomRatioMaxArray[i] + 1));
            await sleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 PASSED with ZoomRatio is: " +
              (mZoomRatioMaxArray[i] + 1));

            let zoomRatio: number = mCameraSession.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 finish");
            if (zoomRatio != (mZoomRatioMaxArray[i] + 1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }

            await stopCameraSession();
          }

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0200 ends here");
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300
     * @tc.name      : Check capture session set zoom ratio with promise(invalid value, max + 0.1)
     * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, max + 0.1)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 start for camera[" + i + "]");

          if (!isEmpty(mZoomRatioRangeArray[i])) {
            await startCameraSession(i);

            mCameraSession.setZoomRatio((mZoomRatioMaxArray[i] + 0.1));
            await sleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 PASSED with ZoomRatio is: " +
              (mZoomRatioMaxArray[i] + 0.1));

            let zoomRatio: number = mCameraSession.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 finish");
            if (zoomRatio != (mZoomRatioMaxArray[i] + 0.1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }

            await stopCameraSession();
          }

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0300 ends here");
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400
     * @tc.name      : Check capture session set zoom ratio with promise(invalid value, min - 1)
     * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, min - 1)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 start for camera[" + i + "]");

          if (!isEmpty(mZoomRatioRangeArray[i])) {
            await startCameraSession(i);

            mCameraSession.setZoomRatio((mZoomRatioMinArray[i] - 1));
            await sleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 PASSED with ZoomRatio is: " +
              (mZoomRatioMaxArray[i] - 1));

            let zoomRatio: number = mCameraSession.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 finish");
            if (zoomRatio != (mZoomRatioMinArray[i] - 1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }

            await stopCameraSession();
          }

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0400 ends here");
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500
     * @tc.name      : Check capture session set zoom ratio with promise(invalid value, min - 0.1)
     * @tc.desc      : Check capture session set zoom ratio with promise(invalid value, min - 0.1)
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500--------------");

      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 start for camera[" + i + "]");

          if (!isEmpty(mZoomRatioRangeArray[i])) {
            await startCameraSession(i);

            mCameraSession.setZoomRatio((mZoomRatioMinArray[i] - 0.1));
            await sleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 finish");
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 PASSED with ZoomRatio is: " +
              (mZoomRatioMaxArray[i] - 0.1));

            let zoomRatio: number = mCameraSession.getZoomRatio();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 finish");
            if (zoomRatio != (mZoomRatioMinArray[i] - 0.1)) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }

            await stopCameraSession();
          }

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 end for camera[" +
            i + "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_GET_ZOOM_RATIO_PROMISE_0500 ends here");
        done();
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200
     * @tc.name      : Check capture session set smooth zoom with promise
     * @tc.desc      : Check capture session set smooth zoom with promise
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 start for camera[" +
            i + "]");

          if (!isEmpty(mZoomRatioRangeArray[i])) {
            await startCameraSession(i);
            // mCameraSession.on('smoothZoomInfoAvailable',
            //   async (err: BusinessError, smoothZoomInfo: cameraObj.SmoothZoomInfo) => {
            //     if (!err) {
            //       console.info(TAG +
            //         "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 on smoothZoomInfoAvailable success");
            //     } else {
            //       console.info(TAG +
            //         "Error in SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 FAILED on smoothZoomInfoAvailable: " +
            //       err.message);
            //       expect().assertFail();
            //     }
            //   })
            mCameraSession.setZoomRatio(mZoomRatioMinArray[i] + 0.1);
            await sleep(1000);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 setZoomRatio: " +
              (mZoomRatioMinArray[i] + 0.1));

            mCameraSession.setSmoothZoom(mZoomRatioMaxArray[i] - 0.1, cameraObj.SmoothZoomMode.NORMAL);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 targetZoomRatio: " +
              (mZoomRatioMaxArray[i] - 0.1));
            await sleep(2000);
            let zoomRatio: number = mCameraSession.getZoomRatio();
            if ((zoomRatio - (mZoomRatioMaxArray[i] - 0.1)) < 0.01) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 PASSED with ZoomRatio is: " +
                zoomRatio);
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 FAILED with ZoomRatio is: " +
                zoomRatio);
              expect().assertFail();
            }

            await stopCameraSession();
          }

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 end for camera[" + i +
            "]");
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_SET_SMOOTH_ZOOM_PROMISE_0200 ends here");
        done();
      }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_0100
     * @tc.name      : Check camera session get supported color sapaces 
     * @tc.desc      : Check camera session get supported color sapaces
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_0100--------------");

        if (mCameraNum == 0) {
            console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_0100 FAILED with NoCamera");
            expect().assertFail();
            done();
        } else {
            for (let i = 0; i < mCameraNum; i++) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_0100 start for camera[" + i + "]");
                  if (!isEmpty(mZoomRatioRangeArray[i])) {
                    await startCameraSession(i);
                    let colorSpaces: Array<colorSpaceManager.ColorSpace> = [];
                    try {
                        colorSpaces = mCameraSession.getSupportedColorSpaces();  
                        console.info(TAG + "Entering get Supported Color Spaces ype: " + colorSpaces);
                        expect(isEmpty(colorSpaces)).assertTrue();
                    } catch (error) {
                        
                        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                        console.error("The getSupportedColorSpaces call failed. error code: "+error.code);
                    }
                    await stopCameraSession();
                  }
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SUPPORTED_COLOR_SPACES_0100 ends here");
            done();
        }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0100
     * @tc.name      : Check camera session set color  sapace 
     * @tc.desc      : Check camera session set color  sapace 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0100--------------");

        if (mCameraNum == 0) {
            console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0100 FAILED with NoCamera");
            expect().assertFail();
            done();
        } else {
            for (let i = 0; i < mCameraNum; i++) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0100 start for camera[" + i + "]");
                  if (!isEmpty(mZoomRatioRangeArray[i])) {
                    await startCameraSession(i);
                    let colorSpaces: Array<colorSpaceManager.ColorSpace> = [];
                    try {
                        colorSpaces = mCameraSession.getSupportedColorSpaces();  
                        console.info(TAG + "Entering get Supported Color Spaces ype: " + colorSpaces);
                        mCameraSession.setColorSpace(colorSpaces[0]);
                    } catch (error) {
                        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                        expect(error.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
                        console.error("The setSupportedColorSpace call failed. error code: "+error.code);
                    }
                    await stopCameraSession();
                  }
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0100 ends here");
            done();
        }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0200
     * @tc.name      : Check camera session get color  sapace 
     * @tc.desc      : Check camera session get color  sapace 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0200--------------");

        if (mCameraNum == 0) {
            console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0200 FAILED with NoCamera");
            expect().assertFail();
            done();
        } else {
            for (let i = 0; i < mCameraNum; i++) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0200 start for camera[" + i + "]");
                  if (!isEmpty(mZoomRatioRangeArray[i])) {
                    await startCameraSession(i);
                    let colorSpace: colorSpaceManager.ColorSpace | undefined = undefined;
                    try {
                        colorSpace = mCameraSession.getActiveColorSpace();
                        expect(!isEmpty(colorSpace)).assertTrue();
                        console.info(TAG + "Entering get Active Color Space type: " + colorSpace);
                    } catch (error) {
                        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                        console.error("The getSupportedColorSpace call failed. error code: "+error.code);
                    }
                    await stopCameraSession();
                  }
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_COLOR_MANAGEMENT_COLOR_SPACE_0200 ends here");
            done();
        }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_0100
     * @tc.name      : Check camera session Auto Device  Switch Supported 
     * @tc.desc      : Check camera session Auto Device  Switch Supported  
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_0100--------------");
        if (mCameraNum == 0) {
            console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_0100 FAILED with NoCamera");
            expect().assertFail();
            done();
        } else {
            for (let i = 0; i < mCameraNum; i++) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_0100 start for camera[" + i + "]");
                  if (!isEmpty(mZoomRatioRangeArray[i])) {
                    await startCameraSession(i);
                    let isSupported = false;
                    try {
                        isSupported = mCameraSession.isAutoDeviceSwitchSupported();
                        console.info(TAG + "Entering Auto Device  Switch Supported Bool: " + isSupported);
                    } catch (error) {
                        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                        console.error("The isAutoDeviceSwitchSupported call failed. error code: "+error.code);
                    }
                    await stopCameraSession();
                  }
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_AUTO_DEVICE_SWITCH_SUPPORTED_0100 ends here");
            done();
        }
    })
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_0100
     * @tc.name      : Check camera session Enable Auto Device  Switch Supported 
     * @tc.desc      : Check camera session Enable Auto Device  Switch Supported  
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_0100', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_0100--------------");

        if (mCameraNum == 0) {
            console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_0100 FAILED with NoCamera");
            expect().assertFail();
            done();
        } else {
            for (let i = 0; i < mCameraNum; i++) {
                console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_0100 start for camera[" + i + "]");
                  if (!isEmpty(mZoomRatioRangeArray[i])) {
                    await startCameraSession(i);
                    let isEnable = true;
                    let isSupported = false;
                    try {
                        mCameraSession.enableAutoDeviceSwitch(isEnable);
                        isSupported = mCameraSession.isAutoDeviceSwitchSupported();
                        console.info(TAG + "Entering Auto Device  Switch Supported Bool: " + isSupported);
                    } catch (error) {
                        expect(error.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
                        expect(error.code == cameraObj.CameraErrorCode.OPERATION_NOT_ALLOWED).assertTrue();
                        expect(error.code == cameraObj.CameraErrorCode.SESSION_NOT_CONFIG).assertTrue();
                        console.error("The enableAutoDeviceSwitch call failed. error code: "+error.code);
                    }
                    await stopCameraSession();
                  }
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENABLE_AUTO_DEVICE_SWITCH_0100 ends here");
            done();
        }
    })
  })
}
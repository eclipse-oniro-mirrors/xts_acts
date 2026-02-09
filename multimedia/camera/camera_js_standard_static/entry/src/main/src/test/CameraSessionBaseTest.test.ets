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

const TAG = "CameraSessionBaseTest: ";

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
let mVideoOutput: cameraObj.VideoOutput;
let isVideoOutputCreated : boolean = false;

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
};

let mVideoConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: mVideoProfileCfg,
  url: 'file:///data/media/CameraSessionBase.mp4',
};

let receiver: image.ImageReceiver | undefined;

export default function cameraSessionTest() {

  let fdNumber: int;
  let fdPath: string;
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
    url: 'file:///data/media/CameraSessionBase.mp4',
  }

  let getVideoReceiveSurface = async () => {
    await getFd('CameraManager.mp4');
    await Utils.msSleep(2000);
    mVideoConfig.url = fdPath;
    mVideoRecorder = await media.createAVRecorder();

    if (mVideoRecorder == undefined) {
      console.log(`  getVideoReceiveSurface mVideoRecorder = undefined`);
    } else {
      await mVideoRecorder!.prepare(mVideoConfig);
      mVideoSurface = await mVideoRecorder!.getInputSurface();

      if (mVideoSurface == undefined) {
        console.log(`  getVideoReceiveSurface mVideoSurface = undefined`);
      } else {
        console.log(`  getVideoReceiveSurface, mVideoSurface :` + mVideoSurface);
      }
    }
    console.log(`${TAG} getSurfaceId start 4`);
  }

  let releaseVideoReceiveSurface = async () => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await mVideoRecorder!.release()
    await closeFd();
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
    if (mCameraDevicesArray == undefined) {
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
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
    } catch(err) {
      console.info('createCaptureSession FAILED');
    }

    if (mCameraSession == undefined) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }

    console.info('Exit createCameraSessionInstance');

    return true;
  }

  let releaseCameraSessionInstance = async () => {
    await mCameraSession.release();
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');

    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx.toInt()]);

    await mCameraInput.open();

    await Utils.msSleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info('Enter releaseInput');

    if (mCameraInput != undefined) {
      await mCameraInput.close();
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
    let cameraOutputCap = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()], cameraObj.SceneMode.NORMAL_VIDEO);

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
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
          if (mPreviewOutput == undefined) {
            console.info(TAG + "createPreviewOutput FAILED");
          }
          console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);

          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[j]);
          if (mPhotoOutput == undefined) {
            console.info(TAG + "createPhotoOutput FAILED");
          }
          console.info(TAG + "createPhotoOutput is: " + mPhotoOutput);
          mVideoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[k], mVideoSurface!);
          if (mVideoOutput == null || mVideoOutput == undefined) {
            console.info(TAG + "createVideoOutput FAILED");
          } else {
            isVideoOutputCreated = true;
          }
          console.info(TAG + "createVideoOutput is: " + mVideoOutput);

        } else {
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceId);
          if (mPreviewOutput == undefined) {
            console.info(TAG + "createPreviewOutput FAILED");
          }
          console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);

          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
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
      await mPreviewOutput.release();
    }

    if (mPhotoOutput != undefined) {
      await mPhotoOutput.release();
    }

    if (isVideoOutputCreated == true && mVideoOutput != undefined) {
      await mVideoOutput.release();
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
    await Utils.msSleep(30);

    await mCameraSession.commitConfig();

    await Utils.msSleep(50);

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

  let stopCameraSession = async (): Promise<boolean> => {
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

  describe('CameraSessionBaseTest', () => {
    console.info(TAG + '----------CameraSessionTest--------------')
    beforeAll(() => {
      console.info('  CameraSessionBaseTest beforeAll start');
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      await getVideoReceiveSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      console.info('  CameraSessionBaseTest beforeAll end');
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
      await releaseVideoReceiveSurface();
      await releaseCameraSessionInstance();
      Utils.msSleep(1000);
      console.info('afterAll case');
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_STATIC_0100
     * @tc.desc   Check capture session begin config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        mCameraSession.beginConfig();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_BEGIN_CONFIG_STATIC_0100 PASSED");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session add input with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_STATIC_0100 start for camera[" +
            i + "]");

          await createInput(i);
          mCameraSession.addInput(mCameraInput);
          mCameraSession.removeInput(mCameraInput);

          await releaseInput();

          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_STATIC_0100 end for camera[" +
            i + "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_INPUT_PROMISE_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session can add input with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_STATIC_0100 start for camera[" + i +
            "]");
          await createInput(i);
          let result = mCameraSession.canAddInput(mCameraInput);
          expect(result == true).assertTrue();
          mCameraSession.addInput(mCameraInput);
          mCameraSession.removeInput(mCameraInput);
          await releaseInput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_STATIC_0100 end for camera[" + i +
            "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_PROMISE_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_STATIC_0100
     * @tc.desc   Check capture session can not add input with promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_STATIC_0100--------------");
      if (mCameraNum == 0) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_STATIC_0100 start for camera[" + i + "]");
          await createInput(i);
          let result = mCameraSession.canAddInput(mCameraInput);
          expect(result == true).assertTrue();
          mCameraSession.addInput(mCameraInput);
          result = mCameraSession.canAddInput(mCameraInput);
          expect(result == false).assertTrue();
          mCameraSession.removeInput(mCameraInput);
          await releaseInput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_STATIC_0100 end for camera[" +
            i + "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_INPUT_ERROR_PROMISE_STATIC_0100 ends here");
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session add output with promise or not for preview
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_STATIC_0100--------------");

      try {
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_STATIC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          await createInput(0);
          createOutput(0);
          mCameraSession.addInput(mCameraInput);
          mCameraSession.addOutput(mPreviewOutput);
          mCameraSession.addOutput(mPhotoOutput);
          if(isVideoOutputCreated) {
            mCameraSession.addOutput(mVideoOutput);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_STATIC_0100 add PASSED");
          mCameraSession.removeOutput(mPreviewOutput);
          mCameraSession.removeOutput(mPhotoOutput);
          if(isVideoOutputCreated) {
            mCameraSession.removeOutput(mVideoOutput);
          }
          mCameraSession.removeInput(mCameraInput);
          await releaseInput();
          await releaseOutput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_STATIC_0100 ends here");
          done();
        }
      } catch (err: BusinessError) {
        console.log(`${TAG} SUB_MULTIMEDIA_CAMERA_SESSION_ADD_REMOVE_OUTPUT_PROMISE_STATIC_0100 err ${err.code}`)
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Check capture session can add output with promise for preview
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100--------------");
      createCameraSessionInstance();
      mCameraSession.beginConfig();
      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          await createInput(0);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start1");
          createOutput(0);
          console.info(`Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start2 + ${mCameraInput} + ${mCameraSession}`);
          let status: boolean = mCameraSession.canAddInput(mCameraInput);
          console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 +${status}`)
          mCameraSession.addInput(mCameraInput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start3");
          let result = mCameraSession.canAddOutput(mPreviewOutput);
          expect(result == true).assertTrue();
          mCameraSession.addOutput(mPreviewOutput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start4");
          let result1 = mCameraSession.canAddOutput(mPhotoOutput);
          expect(result1 == true).assertTrue();
          mCameraSession.addOutput(mPhotoOutput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start5");
          if(isVideoOutputCreated) {
            let result2 = mCameraSession?.canAddOutput(mVideoOutput);
            console.info(TAG +
              `Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start5.5 + ${result} + ${result1} + ${result2}`);
            expect(result2 == true).assertTrue();
            mCameraSession.addOutput(mVideoOutput);
          }


          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 add PASSED");
          mCameraSession.removeOutput(mPreviewOutput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start6");
          mCameraSession.removeOutput(mPhotoOutput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start4");
          if(isVideoOutputCreated) {
            mCameraSession.removeOutput(mVideoOutput);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start8");
          mCameraSession.removeInput(mCameraInput);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start9");
          await releaseInput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 start10");
          await releaseOutput();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 ends here");
          done();
        } catch (err: BusinessError) {
          console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 err + ${JSON.stringify(err)}`)
          console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 err + ${JSON.stringify(err.message)}`)
          console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_CAN_ADD_OUTPUT_PROMISE_STATIC_0100 err + ${JSON.stringify(err.code)}`)
        }

      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_STATIC_0100
     * @tc.desc   Check capture session commit config
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_STATIC_0100--------------");

      try {
        if (mCameraNum == 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_STATIC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          await createInput(0);
          createOutput(0);
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
          await mCameraSession.commitConfig();

          await stopCameraSession();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_STATIC_0100 PASSED");
          done();
        }
      } catch (err: BusinessError) {
        console.log(`SUB_MULTIMEDIA_CAMERA_SESSION_COMMIT_CONFIG_STATIC_0100 err ${err.code}`)
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_STATIC_0100
     * @tc.desc   Check capture session release with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_STATIC_0100--------------");
      let status: number = 0;
      await mCameraSession.release();
      
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_RELEASE_PROMISE_STATIC_0100 ends here");
      expect(status == 0).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100
     * @tc.desc   Check capture session start/stop/release output with promise or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100--------------");

      if (mCameraNum == 0) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100 FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        await Utils.msSleep(5);
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100 start for camera[" + i +
            "]");
          createCameraSessionInstance();
          createOutput(i);
          await createInput(i)
          mCameraSession.beginConfig();
          mCameraSession.addInput(mCameraInput);
          mCameraSession.addOutput(mPreviewOutput);
          mCameraSession.addOutput(mPhotoOutput);
          if(isVideoOutputCreated) {
            mCameraSession.addOutput(mVideoOutput);
          }
          await mCameraSession.commitConfig();
          await mCameraSession.start();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100 start PASSED");
          await Utils.msSleep(20);
          await mCameraSession.stop();
          await releaseInput();
          await releaseOutput();
          await mCameraSession.release();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100 end for camera[" + i +
            "]");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_START_STOP_PROMISE_STATIC_0100 ends here");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_STATIC_0100
     * @tc.desc   videosession callback on focusStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void>=> {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_STATIC_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_STATIC_0100");
        mCameraSession.onFocusStateChange((err: BusinessError | null, focusState: cameraObj.FocusState | undefined) => {
          if (err !== undefined && err!.code !== 0) {
            console.info(TAG + `Callback Error, errorCode: ${err!.code}`);
            expect().assertFail();
          }
          console.info(TAG + `Focus state: ${focusState}`);
        })
        mCameraSession.offFocusStateChange();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_FOCUSSTATECHANGE_STATIC_0100 ERRORCODE: " + err.code);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.desc   videosession callback on error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_STATIC_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_STATIC_0100 SUCCESS");
        mCameraSession.onError((err: BusinessError) => {
          if (!err){
            console.info(TAG + "Entering SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_STATIC_0100 FAILED! error == null || undefined");
            expect().assertFail();
          } else {
            console.info(`Video session error code: ${err.code}`);
          }
        })
        mCameraSession.offError();
        done();
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG + "SUB_MULTIMEDIA_CREATE_VIDEO_SESSION_CALLBACK_ON_ERROR_STATIC_0100 ERRORCODE: " + err.code);
        expect().assertFail();
        done();
      }
      done();
    })

    /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0100
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0100
         * @tc.desc   videosession callback on error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
          console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0100--------------");
          try {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0100 SUCCESS");
            let callback = (err: BusinessError|null, data: cameraObj.ControlCenterStatusInfo|undefined) => {
              if(data && data.effectType && data.isActive) {
                console.info("control center status: " + data.effectType + "  " + data.isActive);
              }
            }
            mCameraSession.onControlCenterEffectStatusChange(callback);
            mCameraSession.offControlCenterEffectStatusChange(callback);
            done();
          } catch (error) {
            let err = error as BusinessError;
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0100 ERRORCODE: " + err.code);
            expect().assertFail();
            done();
          }
          done();
        })

        /**
         * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0200
         * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0200
         * @tc.desc   videosession callback on error
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
          console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0200--------------");
          try {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0200 SUCCESS");
            createCameraSessionInstance();
            await createInput(0)
            mCameraSession.beginConfig();
            mCameraSession.addInput(mCameraInput);
            let flag = mCameraSession.isControlCenterSupported();
            if (flag) {
              console.info("THE CAMERA SUPPORT CONTROL CENTER");
              let types = mCameraSession.getSupportedEffectTypes();
              if(types.length > 0){
                console.info("GET CONTROL CENTER EFFECT TYPES");
              }
              mCameraSession.enableControlCenter(true);
            }
            done();
          } catch (error) {
            let err = error as BusinessError;
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_VIDEO_CONTROL_CENTER_PROMISE_STATIC_0200 ERRORCODE: " + err.code);
            expect().assertFail();
            done();
          }
          done();
        })

  })
}
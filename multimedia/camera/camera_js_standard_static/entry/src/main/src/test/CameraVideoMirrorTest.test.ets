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
import { BusinessError } from '@ohos.base';
import Context from "application.Context";
import Utils from './Util.test';

const TAG = "CameraVideoMirrorTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.VideoSession;
let receiver: image.ImageReceiver | undefined;
let mPhotoSurface: string;
let mVideoRecorder: media.AVRecorder | undefined;
let mVideoSurface: string | undefined;
let mFdPath: string;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;
let mVideoOutput: cameraObj.VideoOutput;
let isVideoOutputCreated: boolean = false;
let mIsMirrorSupportedArray: Array<boolean>;
let isMirrorSupport: boolean;

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
  url: 'file:///data/media/CameraVideoMirrorTest.mp4',
};

export default function cameraVideoMirrorTest() {

  let fdNumber: int;
  let fdPath: string;
  let surfaceId: string = '';

  let getFd = async (pathName: string): Promise<void> => {
    console.log(TAG + 'Entering getFd ')
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
    receiver = image.createImageReceiver( {height:480, width:640} as image.Size, image.ImageFormat.JPEG, 8)
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
    await mVideoRecorder!.release();
    await closeFd();
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (mCameraManager == null) {
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

    mIsMirrorSupportedArray =  new Array<boolean>(mCameraNum.toInt());

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createCameraSessionInstance = () => {
    console.info('Enter createCameraSessionInstance');

    try {
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
    } catch (err) {
      console.info('createCaptureSession FAILED');
    }

    if (mCameraSession == undefined) {
      console.info(TAG + "createCaptureSession FAILED");
      return false;
    }

    console.info('Exit createCameraSessionInstance');

    return true;
  }


  let releaseCameraSessionInstance = async (): Promise<void> => {
    await mCameraSession.release();
  }

  let createInput = async (idx: int): Promise<boolean> => {
    console.info('Enter createInput');

    if (mCameraDevicesArray == null) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx.toInt()]);

    if (mCameraInput == undefined) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    }

    await mCameraInput.open();

    await Utils.msSleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async (): Promise<boolean>  => {
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

  let releaseOutput = async () : Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (mPreviewOutput != undefined) {
      await mPreviewOutput.release();
    }

    if (mPhotoOutput != undefined) {
      await mPhotoOutput.release();
    }

    if (isVideoOutputCreated && mVideoOutput != null && mVideoOutput != undefined) {
      await mVideoOutput.release();
      isVideoOutputCreated = false;
    }

    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: int) : Promise<boolean> => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    createOutput(idx);

    console.info(TAG + "Start to beginConfig");
    mCameraSession.beginConfig();
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

    if (isVideoOutputCreated && mVideoOutput != null && mVideoOutput != undefined) {
      console.info(TAG + "Start to addOutput mVideoOutput");
      mCameraSession.addOutput(mVideoOutput);
    }

    await Utils.msSleep(1);

    await mCameraSession.commitConfig();
    console.info(TAG + "commitConfig end");
    await mCameraSession.start();
    console.info(TAG + "start end");

    await Utils.msSleep(100);

    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");

    await mCameraSession.stop();
    console.info(TAG + "stop end");

    mCameraSession.beginConfig();
    console.info(TAG + "beginConfig end");

    await Utils.msSleep(100);

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

    if (isVideoOutputCreated && mVideoOutput != null && mVideoOutput != undefined) {
      console.info(TAG + "Start to removeOutput mVideoOutput");
      mCameraSession.removeOutput(mVideoOutput);
    }

    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('CameraVideoMirrorTest', () => {
    console.info(TAG + '----------CameraVideoMirrorTest--------------')
    beforeAll(() => {
      await Utils.msSleep(100);
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      await getVideoReceiveSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      createCameraSessionInstance();
      await Utils.msSleep(500);
      console.info('beforeAll case');
    });

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
      await Utils.msSleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_STATIC_0100
     * @tc.desc   Check whether video output is mirror supported
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) : Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_STATIC_0100--------------");
      let caseName: string = "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_IS_MIRROR_SUPPORTED_STATIC_0100";

      if (mCameraNum == 0) {
        console.info(TAG + caseName + " FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        try {
          for (let i = 0; i < mCameraNum; i++) {
            console.info(TAG + caseName + " start for camera " + i);
            await startCameraSession(i);
            if (isVideoOutputCreated) {
              console.info(TAG + caseName + "camera " + i + " isMirrorSupported:" + mVideoOutput.isMirrorSupported());
              console.info(TAG + caseName + "camera " + i + " finish");
            }
            await Utils.msSleep(1000);
            await stopCameraSession();
            console.info(TAG + caseName + " end for camera " + i);
          }
          console.info(TAG + caseName + "success");
          done();
        } catch (err) {
          console.info(TAG + caseName + "FAILED err: " + JSON.stringify(err));
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100
     * @tc.desc   Check video output enable mirror
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void) : Promise<void>  => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100--------------");
      let caseName: string = "SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_ENABLE_MIRROR_STATIC_0100";
      if (mCameraNum == 0) {
        console.info(TAG + caseName + " FAILED with NoCamera");
        expect().assertFail();
        done();
      } else {
        for (let i = 0; i < mCameraNum; i++) {
          console.info(TAG + caseName + " start for camera " + i);
          await startCameraSession(i);
          if (isVideoOutputCreated) {
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
          }
          await Utils.msSleep(1000);
          await stopCameraSession();
          console.info(TAG + caseName + " end for camera " + i);
        }
        console.info(TAG + caseName + "success");
        done();
      }
    })

  })
}

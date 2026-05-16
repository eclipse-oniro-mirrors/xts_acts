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

const TAG = "CameraSessionCameraRotationTest: ";

let mCameraManager: cameraObj.CameraManager;
let mCameraDevicesArray: Array<cameraObj.CameraDevice>;
let mCameraSession: cameraObj.Session;
let mPhotoSurface: string;
let mVideoRecorder: media.AVRecorder | null;
let mVideoSurface: string | undefined;
let AVRecorder: media.AVRecorder | undefined;
let mCameraNum: number;
let mCameraInput: cameraObj.CameraInput;
let mPreviewOutput: cameraObj.PreviewOutput;
let mPhotoOutput: cameraObj.PhotoOutput;
let mVideoOutput: cameraObj.VideoOutput;
let mIsVideoStabilizationModeSupportedArray: Array<number>;
let assertmPreviewOutput: boolean = false;
let assertmPhotoOutput: boolean = false;
let assertmVideoOutput: boolean = false;
let assertmCameraInput: boolean = false;

// 创建视频录制的参数
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

let testLocation: media.Location = {
  latitude: 30,
  longitude: 130
}

let mVideoConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: mVideoProfileCfg,
  url: 'file:///data/media/CameraSessionCameraRotationTest.mp4',
}

let receiver: image.ImageReceiver | undefined;
let surfaceId: string = '';

export default function cameraSessionCameraRotationTest() {

  let fdNumber: int;
  let fdPath: string;

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
      console.info(TAG + "getPreviewOutputSurface FAILED err " + JSON.stringify(err));
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
    url: 'file:///data/media/CameraSessionCameraRotationTest.mp4',
  }

  let getVideoReceiveSurface = async () => {
    await getFd('CameraManager.mp4');
    await Utils.msSleep(2000);
    videoConfig.url = fdPath;
    AVRecorder = await media.createAVRecorder();
    if (AVRecorder == undefined) {
      console.log(`getVideoReceiveSurface AVRecorder = undefined`);
    } else {
      let errs = await AVRecorder!.prepare(videoConfig);
      await Utils.msSleep(5000);
      mVideoSurface = await AVRecorder!.getInputSurface();
      if (mVideoSurface == undefined) {
        console.log(`getVideoReceiveSurface mVideoSurface = undefined`);
      } else {
        console.log(`getVideoReceiveSurface, mVideoSurface: ` + mVideoSurface);
      }
    }
    console.log(`${TAG} getSurfaceId start 4`);
  }

  let releaseVideoReceiveSurface = async () => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await closeFd();
    await Utils.msSleep(100);
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

    mIsVideoStabilizationModeSupportedArray = new Array<number>(mCameraNum);

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let createCameraSessionInstance = (mode: cameraObj.SceneMode) => {
    console.info('Enter createCameraSessionInstance');
    if (mode == cameraObj.SceneMode.NORMAL_PHOTO) {
      mCameraSession = mCameraManager.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
    } else if (mode == cameraObj.SceneMode.NORMAL_VIDEO) {
      mCameraSession = mCameraManager.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
    } else {
      console.info('createSession FAILED,SceneMode is err');
      expect().assertFail();
    }

    if (mCameraSession == undefined) {
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

  let createInput = async (idx: int): Promise<boolean>  => {
    console.info('Enter createInput');

    if (mCameraDevicesArray == undefined) {
      console.info(TAG + "Entering createInputs FAILED with NoCamera");
      return false;
    }

    mCameraInput = mCameraManager.createCameraInput(mCameraDevicesArray[idx.toInt()]);

    if (mCameraInput == undefined) {
      console.info(TAG + "createCameraInput FAILED");
      return false;
    } else {
      assertmCameraInput = true;
    }

    await mCameraInput.open();

    await Utils.msSleep(100);

    console.info(idx + 'th CameraInput is: ' + mCameraInput);

    console.info('Exit createInput');

    return true;
  }

  let releaseInput = async (): Promise<boolean> => {
    console.info('Enter releaseInput');

    if (assertmCameraInput == true && mCameraInput != undefined) {
      await mCameraInput!.close();
      assertmCameraInput = false;
    }

    console.info('Exit releaseInput');

    return true;
  }

  let createOutput = async (idx: int, mode: cameraObj.SceneMode): Promise<boolean> => {
    console.info('Enter createOutput');
    let height:int = 0;
    let width:int = 0;
    let format: cameraObj.CameraFormat = cameraObj.CameraFormat.CAMERA_FORMAT_RGBA_8888;
    let i:int = 0;
    let j:int = 0;
    let k:int = 0;
    let equalFlag:boolean = false;
    let cameraOutputCap: cameraObj.CameraOutputCapability = mCameraManager.getSupportedOutputCapability(mCameraDevicesArray[idx.toInt()], mode);
    console.info(TAG + 'getSupportedOutputCapability is: ' + JSON.stringify(cameraOutputCap));
    let ratio = 4 / 3;
    if (mode == cameraObj.SceneMode.NORMAL_VIDEO) {
      ratio = 16 / 9;
    }

    if (cameraOutputCap != undefined) {
      console.info(TAG + 'cameraOutputCap is not undefined');
      if (mode == cameraObj.SceneMode.NORMAL_VIDEO && cameraOutputCap.previewProfiles != null && cameraOutputCap.photoProfiles != null && cameraOutputCap.videoProfiles != null) {
        for (i = 0; i < cameraOutputCap.previewProfiles.length; i++) {
          height = cameraOutputCap.previewProfiles[i].size.height
          width = cameraOutputCap.previewProfiles[i].size.width;
          format = cameraOutputCap.previewProfiles[i].format;
          let currentRatio = cameraOutputCap.previewProfiles[i].size.width / cameraOutputCap.previewProfiles[i].size.height;
          if (Math.abs(currentRatio - ratio) > 0.01) {
            continue;
          }
          for (k = 0; k < cameraOutputCap.videoProfiles.length; k++) {
            if (cameraOutputCap.videoProfiles[k].size.height === height &&
              cameraOutputCap.videoProfiles[k].size.width === width &&
              cameraOutputCap.videoProfiles[k].format === format) {
              equalFlag = true;
              break;
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
          } else { 
            assertmPreviewOutput = true;
          }
          console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);

          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[j]);
          if (mPhotoOutput == undefined) {
            console.info(TAG + "createPhotoOutput FAILED");
          } else {
            assertmPhotoOutput = true;
          }
          console.info(TAG + "createPhotoOutput is: " + mPhotoOutput);
          mVideoOutput = mCameraManager.createVideoOutput(cameraOutputCap.videoProfiles[k], mVideoSurface!);
          if (mVideoOutput == null || mVideoOutput == undefined) {
            console.info(TAG + "createVideoOutput FAILED");
          } else {
            assertmVideoOutput = true;
            console.info(TAG + "createVideoOutput is: " + mVideoOutput);
          }
        } else {
          mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceId);
          if (mPreviewOutput == undefined) {
            console.info(TAG + "createPreviewOutput FAILED");
          } else { 
            assertmPreviewOutput = true;
          }
          console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);

          mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
          if (mPhotoOutput == undefined) {
            console.info(TAG + "createPhotoOutput FAILED");
          } else {
            assertmPhotoOutput = true;
          }
          console.info(TAG + "createPhotoOutput is: " + mPhotoOutput);
          console.info(TAG + "no equal profile  in this device");
        }
      } else if (mode == cameraObj.SceneMode.NORMAL_PHOTO && cameraOutputCap.previewProfiles != null && cameraOutputCap.photoProfiles != null) {
        mPreviewOutput = mCameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceId);
        if (mPreviewOutput == undefined) {
          console.info(TAG + "createPreviewOutput FAILED");
        } else { 
          assertmPreviewOutput = true;
        }
        console.info(TAG + "createPreviewOutput is: " + mPreviewOutput);

        mPhotoOutput = mCameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
        if (mPhotoOutput == undefined) {
          console.info(TAG + "createPhotoOutput FAILED");
        } else {
          assertmPhotoOutput = true;
        }
        console.info(TAG + "createPhotoOutput is: " + mPhotoOutput);
      }
    }

    console.info('Exit createOutputs');

    return true;
  }

  let releaseOutput = async (): Promise<boolean> => {
    console.info('Enter releaseOutput');

    if (assertmPreviewOutput == true) {
      if (mPreviewOutput != undefined) {
        await mPreviewOutput.release();
        assertmPreviewOutput = false;
      }
    }

    if (assertmPhotoOutput == true) {
      if (mPhotoOutput != undefined) {
        await mPhotoOutput.release();
        assertmPhotoOutput = false;
      }
    }

    if (assertmVideoOutput == true) {
      if (mVideoOutput != null) {
        await mVideoOutput!.release();
        assertmVideoOutput = false;
      }
    }
    console.info('Exit releaseOutput');

    return true;
  }

  let startCameraSession = async (idx: int, mode: cameraObj.SceneMode): Promise<boolean> => {
    console.info(TAG + "Enter startCameraSession");

    await createInput(idx);
    await createOutput(idx, mode);

    await Utils.msSleep(1000);

    if (assertmCameraInput == true && mCameraInput != undefined) {
      console.info(TAG + "Start to addInput");
      mCameraSession.addInput(mCameraInput);
    }

    if (assertmPreviewOutput == true) {
      if (mPreviewOutput != undefined) {
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
    }

    if (assertmPhotoOutput == true) {
      if (mPhotoOutput != undefined) {
        let canAdd: boolean = mCameraSession.canAddOutput(mPhotoOutput);
        if (canAdd) {
          console.info(TAG + "C ddOutput mPhotoOutput");
          mCameraSession.addOutput(mPhotoOutput);
          console.info(TAG + "End to addOutput mPhotoOutput");
        } else {
          console.info(TAG + "addOutput mPhotoOutput error");
        }
      }
    }

    if (assertmVideoOutput == true) {
      if (mVideoOutput != undefined) {
        let canAdd: boolean = mCameraSession.canAddOutput(mVideoOutput);
        if (canAdd) {
          console.info(TAG + "canAddOutput mVideoOutput");
          mCameraSession.addOutput(mVideoOutput!);
          console.info(TAG + "End to addOutput mVideoOutput");
        } else {
          console.info(TAG + "addOutput mVideoOutput error");
        }
      }
    }
    await Utils.msSleep(1000);

    await mCameraSession.commitConfig();

    console.info(TAG + "Exit startCameraSession");

    return true;
  }

  let stopCameraSession = async (): Promise<boolean> => {
    console.info(TAG + "Enter stopCameraSession");

    mCameraSession.beginConfig();

    if (assertmCameraInput == true && mCameraInput != undefined) {
      console.info(TAG + "Start to removeInput input");
      mCameraSession.removeInput(mCameraInput);
    }

    if (assertmPreviewOutput == true) {
      if (mPreviewOutput != undefined) {
        console.info(TAG + "Start to removeOutput mPreviewOutput");
        mCameraSession.removeOutput(mPreviewOutput);
      }
    }

    if (assertmPhotoOutput == true) {
      if (mPhotoOutput != undefined) {
        console.info(TAG + "Start to removeOutput mPhotoOutput");
        mCameraSession.removeOutput(mPhotoOutput);
      }
    }
    
    if (assertmVideoOutput == true) {
      if (mVideoOutput != undefined) {
        console.info(TAG + "Start to removeOutput mVideoOutput");
        mCameraSession.removeOutput(mVideoOutput);
      }
    }
    await releaseInput();
    await releaseOutput();

    console.info(TAG + "Exit stopCameraSession");

    return true;
  }

  describe('cameraSessionCameraRotationTest', () => {
    console.info(TAG + '----------cameraSessionCameraRotationTest--------------')
    beforeAll(() => {
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      await getVideoReceiveSurface();
      getCameraManagerInstance();
      getCameraSupportDevicesArray();
      console.info('beforeAll case');
    })

    beforeEach(() => {
      Utils.msSleep(5000);
      console.info('beforeEach case');
    })

    afterEach(() => {
      console.info('afterEach case');
    })

    afterAll(() => {
      await releaseVideoReceiveSurface();
      await stopCameraSession();
      await releaseCameraSessionInstance();
      Utils.msSleep(1000);
      console.info('afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100
     * @tc.desc   Check capture session support video rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100--------------");
        createCameraSessionInstance(cameraObj.SceneMode.NORMAL_VIDEO);
        await getVideoReceiveSurface();
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100 start for camera");
          await startCameraSession(0, cameraObj.SceneMode.NORMAL_VIDEO);
          let cameraVideoRotation = mVideoOutput!.getVideoRotation(cameraObj.ImageRotation.ROTATION_0);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100 finish");
          if (cameraVideoRotation == cameraObj.ImageRotation.ROTATION_90 ||
            cameraVideoRotation == cameraObj.ImageRotation.ROTATION_270 ||
            cameraVideoRotation == cameraObj.ImageRotation.ROTATION_0 ||
            cameraVideoRotation == cameraObj.ImageRotation.ROTATION_180) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100 PASSED with cameraVideoRotation is: " +
              cameraVideoRotation);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100 FAILED with cameraVideoRotation is: " +
              cameraVideoRotation);
            expect().assertFail();
          }
          await stopCameraSession();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100 end for camera");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100 ends here");
          done();
        }
      } catch (err: BusinessError) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_VIDEO_ROTATION_FUNC_STATIC_0100 error + ${err}+ ${err.code}+ ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100
     * @tc.desc   Check capture session support preview rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100--------------");
        createCameraSessionInstance(cameraObj.SceneMode.NORMAL_PHOTO);
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100 start for camera");
          await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO);
          let cameraPreviewRotation = mPreviewOutput.getPreviewRotation(cameraObj.ImageRotation.ROTATION_0);
          console.info(TAG + "  cameraPreviewRotation: " + cameraPreviewRotation);
          mPreviewOutput.setPreviewRotation(cameraObj.ImageRotation.ROTATION_0, false);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100 finish");
          if (cameraPreviewRotation == cameraObj.ImageRotation.ROTATION_90 ||
            cameraPreviewRotation == cameraObj.ImageRotation.ROTATION_270 ||
            cameraPreviewRotation == cameraObj.ImageRotation.ROTATION_0 ||
            cameraPreviewRotation == cameraObj.ImageRotation.ROTATION_180) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100 PASSED with cameraPreviewRotation is: " +
              cameraPreviewRotation);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100 FAILED with cameraPreviewRotation is: " +
              cameraPreviewRotation);
            expect().assertFail();
          }
          await stopCameraSession();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100 end for camera");
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100 ends here");
          done();
        }
      } catch (err: BusinessError) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PREVIEW_ROTATION_FUNC_STATIC_0100 error + ${err}+ ${err.code}+ ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100
     * @tc.desc   Check capture session support photo rotation get success or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100--------------");
        createCameraSessionInstance(cameraObj.SceneMode.NORMAL_PHOTO);
        if (mCameraNum == 0) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100 FAILED with NoCamera");
          expect().assertFail();
          done();
        } else {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100 start for camera");
          await startCameraSession(0, cameraObj.SceneMode.NORMAL_PHOTO);
          let cameraPhotoRotation = mPhotoOutput.getPhotoRotation(cameraObj.ImageRotation.ROTATION_0);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100 finish");
          if (cameraPhotoRotation == cameraObj.ImageRotation.ROTATION_90 ||
            cameraPhotoRotation == cameraObj.ImageRotation.ROTATION_270 ||
            cameraPhotoRotation == cameraObj.ImageRotation.ROTATION_0 ||
            cameraPhotoRotation == cameraObj.ImageRotation.ROTATION_180) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100 PASSED with cameraPhotoRotation is: " +
              cameraPhotoRotation);
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100 FAILED with cameraPhotoRotation is: " +
              cameraPhotoRotation);
            expect().assertFail();
          }
          await stopCameraSession();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100 end for camera");
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100 ends here");
        done();
      } catch (err: BusinessError) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_SESSION_GET_CAMERA_PHOTO_ROTATION_FUNC_STATIC_0100 error + ${err}+ ${err.code}+ ${err.message}`);
        expect().assertFail();
        done();
      }

    })
  })
}
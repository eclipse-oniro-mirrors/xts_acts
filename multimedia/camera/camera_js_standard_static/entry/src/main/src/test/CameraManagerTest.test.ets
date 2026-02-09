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
import fs from '@ohos.file.fs';
import media from '@ohos.multimedia.media';
import image from '@ohos.multimedia.image';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Hypium, TestType, Size, Level } from "../../../hypium/index";
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import Context from "application.Context";
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';

const TAG = "CameraUnitTest: ";

let mPhotoSurface: string;
let mCameraManager: cameraObj.CameraManager | undefined;
let mCameraDevicesArray: Array<cameraObj.CameraDevice> = [];
let mVideoRecorder: media.AVRecorder | null = null;
let mVideoSurface: string | undefined;
let surfaceIds: string;
let AVRecorder: media.AVRecorder | undefined;
let mCameraNum: number;
let receiver: image.ImageReceiver | undefined;

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

let testLocation: media.Location = {
  latitude: 30,
  longitude: 130
}

let videoConfig: media.AVRecorderConfig = {
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: videoProfile,
  url: 'file:///data/media/CameraManagerTest.mp4',
}

export default function cameraManagerTest() {

  let getImageReceiverSurfaceId = async () => {
    console.log(TAG + 'Entering create Image receiver')
    receiver = image.createImageReceiver({height:640, width:480} as image.Size, image.ImageFormat.JPEG, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Receiver is ok')
      surfaceIds = await receiver!.getReceivingSurfaceId()
      console.log(TAG + 'Received id: ' + JSON.stringify(surfaceIds))
    } else {
      console.log(TAG + 'Receiver is not ok')
    }
  }

  let fdNumber: int;
  let fdPath: string = '';
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

  let getVideoReceiveSurface = async () => {
    await getFd('CameraManager.mp4');
    await Utils.msSleep(2000);
    videoConfig.url = fdPath;
    AVRecorder = await media.createAVRecorder();
    await AVRecorder!.prepare(videoConfig);
    mVideoSurface = await AVRecorder!.getInputSurface();
    console.log(`${TAG} getSurfaceId start 4`);
  }

  let releaseVideoReceiveSurface = async () => {
    console.log(TAG + 'Entering releaseVideoReceiveSurface')
    await mVideoRecorder!.release()
    mVideoRecorder = null
    await closeFd();
    console.log(TAG + 'Exit releaseVideoReceiveSurface')
  }

  let isEmpty = (data: ESObject) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty01 = (data: cameraObj.CameraManager) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let isEmpty02 = (data: Array<cameraObj.CameraDevice>) => {
    if (data == null || data == undefined) {
      return true;
    }
    return false;
  }

  let getCameraManagerInstance = () => {
    console.info('Enter getCameraManagerInstance');
    let appContext: Context = Hypium.get("Context") as Context;
    mCameraManager = cameraObj.getCameraManager(appContext);
    if (isEmpty01(mCameraManager!)) {
      console.info(TAG + "getCameraManager FAILED");
      return false;
    }

    console.info('Exit getCameraManagerInstance');

    return true;
  }

  let getCameraSupportDevicesArray = () => {
    console.info('Enter getCameraSupportDevicesArray');

    mCameraDevicesArray = mCameraManager!.getSupportedCameras();
    if (isEmpty02(mCameraDevicesArray)) {
      console.info(TAG + "getSupportedCameras FAILED");
      return false;
    }

    mCameraNum = mCameraDevicesArray.length;

    console.info(TAG + "getCameraSupportDevicesArray is: " + mCameraNum);

    console.info('Exit getCameraSupportDevicesArray');

    return true;
  }

  let getSupportedOutputCapability = (cameraDevice: cameraObj.CameraDevice) => {
    if (isEmpty01(mCameraManager!)) {
      console.info(TAG + "Entering getSupportedOutputCapability cameraManager == null || undefined")
      expect().assertFail();
      return undefined;
    }

    let outputCapability = mCameraManager!.getSupportedOutputCapability(cameraDevice, cameraObj.SceneMode.NORMAL_VIDEO);

    if (outputCapability == undefined) {
      console.info(TAG + "Entering getSupportedOutputCapability outputCapability == null || undefined")
    } else {
      console.info('CameraUnitTest: getSupportedOutputCapability:  + ${JSON.stringify(outputCapability)}');
    }

    return outputCapability;
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


  describe('CameraManagerTest', () => {
    console.info(TAG + '----------CameraManagerTest--------------')
    beforeAll(() => {
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      getCameraManagerInstance();
      await getImageReceiverSurfaceId();
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
      Utils.msSleep(1000);
      console.info('afterAll case');
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_STATIC_0100
     * @tc.desc   Create camera manager instance promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_STATIC_0100--------------");
      let appContext: Context = Hypium.get("Context") as Context;
      let cameraManagerPromise = cameraObj.getCameraManager(appContext);
      expect(cameraManagerPromise == undefined).assertFalse();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_PROMISE_STATIC_0100 cameraManagerPromise: " +
      JSON.stringify(cameraManagerPromise));
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100
     * @tc.desc   Get camera from cameramanager to get array of camera promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100--------------");
      if (isEmpty01(mCameraManager!)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let mCameraDevicesArrayPromise = mCameraManager!.getSupportedCameras();
        if (mCameraDevicesArrayPromise != null && mCameraDevicesArrayPromise.length > 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 success");
          for (let i = 0; i < mCameraDevicesArrayPromise.length; i++) {
            let cameraId = mCameraDevicesArrayPromise[i].cameraId;
            expect(cameraId == undefined).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 camera" + i + "Id: " +
              cameraId);
            let cameraPosition = mCameraDevicesArrayPromise[i].cameraPosition;
            expect(cameraPosition == undefined).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 camera" + i + "Position: " +
              cameraPosition);
            let cameraType = mCameraDevicesArrayPromise[i].cameraType;
            expect(cameraType == undefined).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 camera" + i + "Type: " +
              cameraType);
            let connectionType = mCameraDevicesArrayPromise[i].connectionType
            expect(connectionType == undefined).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 connection" + i + "Type: " +
              connectionType);
            let hostDeviceName = mCameraDevicesArrayPromise[i].hostDeviceName
            expect(hostDeviceName == undefined).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 hostDeviceName" + i + "Type: " +
              hostDeviceName);
            let hostDeviceType = mCameraDevicesArrayPromise[i].hostDeviceType
            expect(hostDeviceType == undefined).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 hostDeviceType" + i + "Type: " +
              hostDeviceType);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 hostDeviceType1" + "Type: " +
          cameraObj.HostDeviceType.UNKNOWN_TYPE);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 hostDeviceType2" + "Type: " +
          cameraObj.HostDeviceType.PHONE);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 hostDeviceType3" + "Type: " +
          cameraObj.HostDeviceType.TABLET);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 PASSED");
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 FAILED");
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_STATIC_0100 ends here");
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100
     * @tc.desc   Get camera from cameramanager to get array of camera promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100--------------");
      if (isEmpty01(mCameraManager!)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let mCameraDevicesArrayPromise = mCameraManager!.getSupportedCameras();
        if (mCameraDevicesArrayPromise != null && mCameraDevicesArrayPromise.length > 0) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100 success");
          for (let i = 0; i < mCameraDevicesArrayPromise.length; i++) {
            let sceneModes = mCameraManager!.getSupportedSceneModes(mCameraDevicesArrayPromise[i]);
            if (sceneModes != null && sceneModes.length > 0) {
              sceneModes.forEach(sceneMode => {
                expect(sceneMode == undefined).assertFalse();
              });
            }
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100 PASSED");
        } else {
          expect().assertFail();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100 FAILED");
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_SCENE_MODE_STATIC_0100 ends here");
      await Utils.msSleep(1000);
      done();
    })

    /*GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_TC*/
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100
     * @tc.desc   Get supported preview formats from camera-0 camerainput async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: () => void): Promise<void> => {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100--------------");
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let sceneModes = mCameraManager!.getSupportedSceneModes(camerasArray[i]);
          if (sceneModes != null && sceneModes.length > 0) {
            for (const sceneMode of sceneModes) {
              let cameraOutputCap = mCameraManager!.getSupportedOutputCapability(camerasArray[i], sceneMode);
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100 camera:" +
              camerasArray[i].cameraId);
              if (cameraOutputCap != undefined) {
                let previewProfilesArray: Array<cameraObj.Profile> = cameraOutputCap.previewProfiles as Array<cameraObj.Profile>;
                if (previewProfilesArray == null) {
                  console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100 previewProfilesArray == null || undefined")
                  expect().assertFail();
                }
                let photoProfilesArray = cameraOutputCap.photoProfiles;
                if (photoProfilesArray == null) {
                  console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100 photoProfilesArray == null || undefined")
                  expect().assertFail();
                }
                let videoProfilesArray = cameraOutputCap.videoProfiles;
                if (videoProfilesArray == undefined && sceneMode == 2) {
                  console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100 videoProfilesArray == null || undefined")
                  expect().assertFail();
                }
                let metadataObjectTypesArray = cameraOutputCap.supportedMetadataObjectTypes;
                if (metadataObjectTypesArray == null) {
                  console.info(TAG +
                    "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100 metadataObjectTypesArray == null || undefined")
                }
              }
            }
          }
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100 PASSED camera:" +
          camerasArray[i].cameraId);
        }
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_BY_MODE_CALLBACK_STATIC_0100 ends here");
        done();
      })

    /*GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_TC*/
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100
     * @tc.desc   Get supported preview formats from camera-0 camerainput async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100--------------");
      let camerasArray = mCameraDevicesArray;
      for (let i = 0; i < camerasArray.length; i++) {
        let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100 camera:" +
        camerasArray[i].cameraId);
        if (cameraOutputCap != undefined) {
          let previewProfilesArray = cameraOutputCap.previewProfiles;
          if (previewProfilesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100 previewProfilesArray == null || undefined")
            expect().assertFail();
          }

          let photoProfilesArray = cameraOutputCap.photoProfiles;
          if (photoProfilesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100 photoProfilesArray == null || undefined")
            expect().assertFail();
          }

          let videoProfilesArray = cameraOutputCap.videoProfiles;
          if (videoProfilesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100 videoProfilesArray == null || undefined")
            expect().assertFail();
          }

          let metadataObjectTypesArray = cameraOutputCap.supportedMetadataObjectTypes;
          if (metadataObjectTypesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100 metadataObjectTypesArray == null || undefined")
          }
        }

        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100 PASSED camera:" +
        camerasArray[i].cameraId);
      }
      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_CALLBACK_STATIC_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100
     * @tc.desc   Get supported preview formats from camera-0 camerainput promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100--------------");
      for (let i = 0; i < mCameraDevicesArray.length; i++) {
        let cameraOutputCap = getSupportedOutputCapability(mCameraDevicesArray[i]);
        console.info("Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100 camera:" +
        mCameraDevicesArray[i].cameraId);
        if (cameraOutputCap == undefined) {
          let previewProfilesArray = cameraOutputCap!.previewProfiles;
          if (previewProfilesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100 previewProfilesArray == null || undefined")
            expect().assertFail();
          }

          let photoProfilesArray = cameraOutputCap!.photoProfiles;
          if (photoProfilesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100 photoProfilesArray == null || undefined")
            expect().assertFail();
          }

          let videoProfilesArray = cameraOutputCap!.videoProfiles;
          if (videoProfilesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100 videoProfilesArray == null || undefined")
            expect().assertFail();
          }
          expect(videoProfilesArray == null).assertFalse();

          let metadataObjectTypesArray = cameraOutputCap!.supportedMetadataObjectTypes;
          if (metadataObjectTypesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100 metadataObjectTypesArray == null || undefined")
          }
        }


        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100 PASSED camera:" +
        mCameraDevicesArray[i].cameraId);
      }
      console.info("CameraUnitTest: Entering SUB_MULTIMEDIA_CAMERA_GET_SUPPORTED_CAMERA_OUTPUT_CAPABILITY_PROMISE_STATIC_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100
     * @tc.desc   Get supported preview formats from camera-0 camerainput promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100--------------");
      let camerasArray = mCameraDevicesArray;
      for (let i = 0; i < camerasArray.length; i++) {
        let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
        console.info("Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100 camera:" + camerasArray[i].cameraId);
        if (cameraOutputCap != undefined) {
          let previewProfilesArray = cameraOutputCap!.previewProfiles;
          if (previewProfilesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100 previewProfilesArray == null || undefined")
            expect().assertFail();
          }

          for (let i = 0; i < previewProfilesArray!.length; i++) {
            let previewProfilesFormat = previewProfilesArray![i].format;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100 previewProfilesFormat: " +
              previewProfilesFormat);
            let previewProfilesSize = previewProfilesArray![i].size;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100 width: " +
            previewProfilesSize.width);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100 height: " +
            previewProfilesSize.height);
          }
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_PROFILES_STATIC_0100 PASSED camera:" +
        camerasArray[i].cameraId);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100
     * @tc.desc   Get supported preview formats from camera-0 camerainput promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100--------------");
      let camerasArray = mCameraDevicesArray;
      for (let i = 0; i < camerasArray.length; i++) {
        let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
        console.info("Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100 camera:" + camerasArray[i].cameraId);
        if (cameraOutputCap != undefined) {
          let photoProfilesArray = cameraOutputCap!.photoProfiles;
          if (cameraOutputCap == undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100 photoProfilesArray == null || undefined")
            expect().assertFail();
          }

          for (let i = 0; i < photoProfilesArray!.length; i++) {
            let photoProfilesFormat = photoProfilesArray![i].format;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100 photoProfilesFormat: " +
              photoProfilesFormat);
            let photoProfilesSize = photoProfilesArray![i].size;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100 width: " + photoProfilesSize.width);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100 height: " +
            photoProfilesSize.height);
          }
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_PROFILES_STATIC_0100 PASSED camera:" +
        camerasArray[i].cameraId);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100
     * @tc.desc   Get supported preview formats from camera-0 camerainput promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100--------------");
      let camerasArray = mCameraDevicesArray;
      for (let i = 0; i < camerasArray.length; i++) {
        let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
        console.info("Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100 camera:" + camerasArray[i].cameraId);
        if (cameraOutputCap != undefined) {
          let videoProfilesArray = cameraOutputCap!.videoProfiles;
          if (videoProfilesArray == null) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100 videoProfilesArray == null || undefined")
            expect().assertFail();
          }

          for (let i = 0; i < videoProfilesArray!.length; i++) {
            let videoProfilesFormat = videoProfilesArray![i].format;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100 videoProfilesFormat: " +
              videoProfilesFormat);
            let videoProfilesSize = videoProfilesArray![i].size;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100 width: " + videoProfilesSize.width);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100 height: " +
            videoProfilesSize.height);
            let videoProfilesFrameRateRange = videoProfilesArray![i].frameRateRange;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100 min: " +
            videoProfilesFrameRateRange.min);
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100 max: " +
            videoProfilesFrameRateRange.max);
          }
        }

        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_PROFILES_STATIC_0100 PASSED camera:" +
        camerasArray[i].cameraId);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0200
     * @tc.desc   Create camerainput from camera-0 cameraId promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0200--------------");
      if (isEmpty01(mCameraManager!)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0200 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let cameraInputPromise = mCameraManager!.createCameraInput(camerasArray[i]);
          if (cameraInputPromise == undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0200 cameraInputPromise == null || undefined")
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0200 camera: " +
          camerasArray[i].cameraId);
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0200 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_STATIC_0100
     * @tc.desc   Create camerainput from camera-0 cameraposition back & cameratype unspecified promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_STATIC_0100--------------");
      if (isEmpty01(mCameraManager!)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_STATIC_0100 cameraManager == null || undefined")
        expect().assertFail();
      } else {
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let cameraInputPromiseByType =
            mCameraManager!.createCameraInput(camerasArray[i].cameraPosition, camerasArray[i].cameraType);
          if (cameraInputPromiseByType == undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_STATIC_0100 cameraInputPromiseByType == null || undefined")
            expect().assertFail();
          }
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_STATIC_0100 camera: " +
          camerasArray[i].cameraId);
        }
      }
      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_BY_POSITION_AND_TYPE_PROMISE_STATIC_0100 ends here");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_STATIC_0100--------------");
      let camerasArray = mCameraDevicesArray;
      for (let i = 0; i < camerasArray.length; i++) {
        let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
        console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_STATIC_0100 camera:" +
        camerasArray[i].cameraId);
        if (cameraOutputCap != undefined) {
          let previewProfilesArray = cameraOutputCap.previewProfiles;
          if (previewProfilesArray == null || previewProfilesArray == undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_STATIC_0100 previewProfilesArray == null || undefined")
            expect().assertFail();
          } else {
            for (let j = 0; j < previewProfilesArray!.length; j++) {
              let previewOutputPromise =
                mCameraManager!.createPreviewOutput(previewProfilesArray![j], surfaceId);
              if (previewOutputPromise == undefined) {
                console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_STATIC_0100 previewOutputPromise == null || undefined")
                expect().assertFail();
              }
            }
          }

        }

      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PREVIEW_OUTPUT_PROMISE_STATIC_0100 PASS");
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_STATIC_0100--------------");
      let camerasArray = mCameraDevicesArray;
      for (let i = 0; i < camerasArray.length; i++) {
        let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
        console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_STATIC_0100 camera:" +
        camerasArray[i].cameraId);
        if (cameraOutputCap != undefined) {
          let photoProfilesArray = cameraOutputCap!.photoProfiles;
          if (photoProfilesArray == null || photoProfilesArray == undefined) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_STATIC_0100 photoProfilesArray == null || undefined")
            expect().assertFail();
          } else {
            for (let j = 0; j < photoProfilesArray!.length; j++) {
              let photoOutputPromise = mCameraManager!.createPhotoOutput(photoProfilesArray![j]);
              if (photoOutputPromise == undefined) {
                console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_STATIC_0100 photoOutputPromise == null || undefined")
                expect().assertFail();
              }
            }
          }

        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_PHOTO_OUTPUT_PROMISE_STATIC_0100 PASS");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100--------------");
        await getVideoReceiveSurface();
        let camerasArray = mCameraDevicesArray;
        for (let i = 0; i < camerasArray.length; i++) {
          let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
          console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100 camera:" +
          camerasArray[i].cameraId);
          if (cameraOutputCap != undefined) {
            let videoProfilesArray = cameraOutputCap!.videoProfiles;
            if (videoProfilesArray == null || videoProfilesArray == undefined) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100 videoProfilesArray == null || undefined")
              expect().assertFail();
            } else {
              for (let j = 0; j < videoProfilesArray!.length; j++) {
                if (videoProfilesArray && mVideoSurface) {
                  let videoOutputPromise = mCameraManager!.createVideoOutput(videoProfilesArray![j], mVideoSurface!);
                  videoOutputPromise.start();
                  if (videoOutputPromise == undefined) {
                    console.info(TAG +
                      "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100 videoOutputPromise == null || undefined")
                  } else {
                    console.info(TAG +
                      "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_CALLBACK_0100 videoOutputPromise = " +
                      videoOutputPromise);
                    break;
                  }
                } else {
                  console.info(TAG +
                    `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${mVideoSurface}`)
                }
              }
            }
          }
        }
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100 PASS");
        done();
      } catch (err) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_VIDEO_OUTPUT_PROMISE_STATIC_0100 error");
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Create camerainput from camera-0 cameraposition front & cameratype unspecified async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100--------------");
      let camerasArray = mCameraDevicesArray;
      for (let i = 0; i < camerasArray.length; i++) {
        let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
        console.info("SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100 camera:" +
        camerasArray[i].cameraId);
        if (cameraOutputCap != undefined) {
          let metadataObjectTypeArray = cameraOutputCap!.supportedMetadataObjectTypes;
          if (metadataObjectTypeArray != null) {
            let metadataOutputPromise = mCameraManager!.createMetadataOutput(metadataObjectTypeArray);
            if (metadataOutputPromise == undefined) {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100 metadataOutputPromise == null || undefined")
              expect().assertFail();
            } else {
              console.info(TAG +
                "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100 metadataOutputPromise = " +
                metadataOutputPromise)
            }
          } else {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100 metadataObjectTypeArray == null || undefined")
          }
        }
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_METADATA_OUTPUT_PROMISE_STATIC_0100 PASS");
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_STATIC_0100
     * @tc.desc   Create Capturesession instance promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_STATIC_0100 to operate");
      let captureSessionPromise = mCameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
      if (captureSessionPromise == undefined) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_STATIC_0100 captureSessionPromise == null || undefined")
        expect().assertFail();
      }
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_PROMISE_STATIC_0100 PASSED");
      await captureSessionPromise.release();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100
     * @tc.desc   camera manager on cameraStatus api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100--------------");
      if (isEmpty01(mCameraManager!)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100 mCameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100 to operate");
        mCameraManager!.onCameraStatus((err: BusinessError<void> | null, data: cameraObj.CameraStatusInfo | undefined) => {
          if (err!.code == 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100 FAILED: " + err!.message);
          }
          done();
        })
        try {
          let camerasArray = mCameraDevicesArray;
          let cameraInputPromise = mCameraManager!.createCameraInput(camerasArray[0]);
          await cameraInputPromise.open()
          await Utils.msSleep(500)
          await cameraInputPromise.close()
        } catch (err) {
          expect().assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_ON_CAMERASTATUS_STATIC_0100 err: " + JSON.stringify(err));
          done()
        }
        mCameraManager!.offCameraStatus()
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_STATIC_0100
     * @tc.desc   camera manager on fold status api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_STATIC_0100--------------");
      if (isEmpty01(mCameraManager!)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_STATIC_0100 mCameraManager == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_STATIC_0100 to operate");
        mCameraManager!.onFoldStatusChange((err: BusinessError<void> | null, data: cameraObj.FoldStatusInfo | undefined) => {
          if (err!.code == 0) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_STATIC_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_FOLD_STATUS_STATIC_0100 failed");
            expect(false).assertTrue();
          }
        })
        mCameraManager!.offFoldStatusChange();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_HOST_DEVICE_TYPE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_HOST_DEVICE_TYPE_STATIC_0100
     * @tc.desc   test Host Device Type enum UNKNOWN_TYPE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_HOST_DEVICE_TYPE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_HOST_DEVICE_TYPE_STATIC_0100--------------");
      let camerasArray = mCameraDevicesArray;
      for (let i = 0; i < camerasArray.length; i++) {
        if (camerasArray[i] != undefined) {
          let cameraOutputCap = getSupportedOutputCapability(camerasArray[i]);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HOST_DEVICE_TYPE_STATIC_0100 hostDeviceType == " + camerasArray[i].hostDeviceType)
          if (cameraOutputCap == undefined) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HOST_DEVICE_TYPE_STATIC_0100 cameraOutputCap == null || undefined")
            expect().assertFail();
          }
        } else {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_HOST_DEVICE_TYPE_STATIC_0100 camerasArray == null || undefined")
          expect().assertFail();
        }
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ORIENTATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ORIENTATION_STATIC_0100
     * @tc.desc   test camera Orientation api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    // it('SUB_MULTIMEDIA_CAMERA_ORIENTATION_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
    //   console.info("--------------SUB_MULTIMEDIA_CAMERA_ORIENTATION_STATIC_0100--------------");
    //   let camerasArray = mCameraDevicesArray;
    //   for (let i = 0; i < camerasArray.length; i++) {
    //     if (camerasArray[i] != undefined) {
    //       let cameraOrientation = camerasArray[i].cameraOrientation
    //       console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ORIENTATION_STATIC_0100 cameraOrientation == " + cameraOrientation)
    //       if (cameraOrientation == undefined) {
    //         console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ORIENTATION_STATIC_0100 cameraOutputCap == null || undefined")
    //         expect().assertFail();
    //       }
    //     } else {
    //       console.info(TAG + "SUB_MULTIMEDIA_CAMERA_ORIENTATION_STATIC_0100 camerasArray == null || undefined")
    //       expect().assertFail();
    //     }
    //   }
    //   done();
    // })

    /**
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICES_STATIC_0100
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICES_STATIC_0100
     * @tc.desc   test getCameraDevices api
     * @tc.size   MEDIUM
     * @tc.type   Function
     * @tc.level  Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICES_STATIC_0100--------------");
      if (isEmpty01(mCameraManager!)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICES_STATIC_0100 mCameraManager == null || undefined")
        expect().assertFail();
        done();
      }
      let camerasArray = mCameraDevicesArray;
      if (!isEmpty02(camerasArray)) {
        camerasArray.forEach(cameraDevice => {
          try {
            let types: Array<cameraObj.CameraType> = [cameraDevice.cameraType];
            let devices = mCameraManager!.getCameraDevices(cameraDevice.cameraPosition, types, cameraDevice.connectionType);
            console.info(TAG + "getCameraDevices success, length: " + devices.length);
            expect(devices.length).assertLarger(0);
          } catch (error) {
            let err = error as BusinessError;
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_GET_CAMERA_DEVICES_STATIC_0100 failed: " + err.message);
            expect().assertFail();
          }
        });
      }
      done();
    })
  })
}
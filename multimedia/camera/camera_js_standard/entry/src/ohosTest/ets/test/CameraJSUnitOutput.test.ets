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

const TAG = "CameraUnitTest: ";

let context = getContext();
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

// 创建录像输出流
let AVRecorder: media.AVRecorder;
let surfaceId: string;
let cameraManager: cameraObj.CameraManager;
let cameraDevicesArray: Array<cameraObj.CameraDevice>;
let captureSession: cameraObj.CaptureSession;
let cameraSession: cameraObj.Session;
let cameraInput: cameraObj.CameraInput;
let previewOutput: cameraObj.PreviewOutput;
let photoOutput: cameraObj.PhotoOutput;
let videoOutput: cameraObj.VideoOutput;
let metadataOutput: cameraObj.MetadataOutput;
let videoSurfaceId: string;
let receiver: image.ImageReceiver;

let mMetadataObjectTypeArray: Array<cameraObj.MetadataObjectType> | undefined;
let mMetadataObjectArray: Array<cameraObj.MetadataObject>;

let sleep = (ms: number = 66): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface GeneratedObjectLiteralInterface {
  latitude: number;
  longitude: number;
  altitude: number;
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

let isEmpty = (data: ESObject) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

// 创建input参数为cameraDevice的下标
let createInput = async (index: number) => {
  cameraInput = cameraManager.createCameraInput(cameraDevicesArray[index]);
  if (!isEmpty(cameraInput)) {
    await cameraInput.open();
  }
}

// 创建Output参数为cameraDevice的下标、相机模式
let createOutput = (index: number, mode: number) => {
  let cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevicesArray[index], mode);
  previewOutput = cameraManager.createPreviewOutput(cameraOutputCap.previewProfiles[0], surfaceIds);
  photoOutput = cameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
  console.log(TAG + `Receiver is ok + ${JSON.stringify(photoOutput)}`)
}

// 创建Session对象参数为相机模式
let createPhotoSession = (mode: number) => {
  cameraSession = cameraManager.createSession(mode);
  cameraSession.beginConfig();
}

// 释放相机资源
let stopCameraSession = async () => {
  cameraSession.beginConfig();
  if (!isEmpty(cameraInput)) {
    cameraSession.removeInput(cameraInput);
    await cameraInput.close();
  }
  if (!isEmpty(previewOutput)) {
    cameraSession.removeOutput(previewOutput);
    await previewOutput.release();
  }
}

// 添加相机流参数为cameraDevice的下标、相机模式
let addCommit = async (i: number, mode: number) => {
  await createInput(i);
  createOutput(i, mode);
  if (cameraInput) {
    cameraSession.addInput(cameraInput);
  }
  if (previewOutput) {
    cameraSession.addOutput(previewOutput);
  }
  if (photoOutput) {
    cameraSession.addOutput(photoOutput);
  }
}

export default function cameraJSUnitOutput() {

  let getImageReceiverSurfaceId = async () => {
    console.log(TAG + 'Entering create Image receiver')
    receiver = image.createImageReceiver(640, 480, 4, 8)
    console.log(TAG + 'before receiver check')
    if (receiver !== undefined) {
      console.log(TAG + 'Receiver is ok')
      surfaceId = await receiver.getReceivingSurfaceId()
      console.log(TAG + 'Received id: ' + JSON.stringify(surfaceId))
    } else {
      console.log(TAG + 'Receiver is not ok')
    }
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

  let release = async () => {
    console.log(TAG + "start release");
    await AVRecorder!.release();
    AVRecorder = null!;
    await captureSession.release();
    console.log(TAG + "release end")
  }

  let getSupportedOutputCapabilityInPromise = (cameraDevice: cameraObj.CameraDevice, mode: cameraObj.SceneMode) => {
    if (isEmpty(cameraManager)) {
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined")
      expect().assertFail();
      return undefined;
    }
    let outputCapabilityPromise = cameraManager.getSupportedOutputCapability(cameraDevice, mode);
    console.info("CameraUnitTest: Entering testSupportedOutputCapabilityPromise: " +
    JSON.stringify(outputCapabilityPromise));
    expect(isEmpty(outputCapabilityPromise)).assertFalse();

    return outputCapabilityPromise;
  }


  describe('cameraJSUnitOutput', () => {
    console.info(TAG + '----------cameraJSUnitOutput begin--------------')
    let dr = Driver.create();
    beforeAll(async () => {
      await getImageReceiverSurfaceId();
      await sleep(2000);
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
      await sleep(2000);
      console.info('beforeEach case');
    })

    afterEach(async () => {
      console.info('afterEach case');
    })

    afterAll(() => {
      closeFd();
      release();
      console.info('afterAll case');
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100
     * @tc.name      : Create CameraManager instance async api
     * @tc.desc      : Create CameraManager instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100--------------");
      try {
        cameraManager = cameraObj.getCameraManager(context);
        await sleep(1000);
      } catch (error) {
        expect(isEmpty(error)).assertTrue();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100
     * @tc.name      : Get camera from cameramanager to get array of camera async api
     * @tc.desc      : Get camera from cameramanager to get array of camera async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100', 1, async (done: Function) => {
      console.info("--------------GET_CAMERAS--------------");
      cameraDevicesArray = cameraManager.getSupportedCameras();
      if (isEmpty(cameraDevicesArray)) {
        expect().assertFail();
        console.info(TAG + "Entering GET_CAMERAS FAILED cameraArray is null || undefined");
      } else {
        console.info(TAG + "Entering GET_CAMERAS data is not null || undefined");
        if (cameraDevicesArray != null && cameraDevicesArray.length > 0) {
          for (let i = 0; i < cameraDevicesArray.length; i++) {
            // Get the variables from camera object
            let cameraId = cameraDevicesArray[i].cameraId;
            expect(isEmpty(cameraId)).assertFalse();
            console.info(TAG + "Entering GET_CAMERAS camera" + i + "Id: " + cameraId);
            let cameraPosition = cameraDevicesArray[i].cameraPosition;
            expect(isEmpty(cameraPosition)).assertFalse();
            console.info(TAG + "Entering GET_CAMERAS camera" + i + "Position: " + cameraPosition);
            let cameraType = cameraDevicesArray[i].cameraType;
            expect(isEmpty(cameraType)).assertFalse();
            console.info(TAG + "Entering GET_CAMERAS camera" + i + "Type: " + cameraType);
            let connectionType = cameraDevicesArray[i].connectionType
            expect(isEmpty(connectionType)).assertFalse();
            console.info(TAG + "Entering GET_CAMERAS connection" + i + "Type: " + connectionType);
          }
          expect(true).assertTrue();
          console.info(TAG + "Entering GET_CAMERAS PASSED");
        }
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_OUTPUT_PROMISE_0100
     * @tc.name      : Create previewOutput instance async api
     * @tc.desc      : Create previewOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', 2, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100--------------");
      cameraInput = cameraManager.createCameraInput(cameraDevicesArray[0]);
      if (isEmpty(cameraInput)) {
        console.info(TAG + "SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100 FAILED");
      }
      cameraInput.open(async (err) => {
        if (!err) {
          expect(true).assertTrue();
        } else {
          expect().assertFail();
        }
      })
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100
     * @tc.name      : Create previewOutput instance async api
     * @tc.desc      : Create previewOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100--------------");

      console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100")
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      let previewProfilesArray = cameraOutputCap?.previewProfiles;
      if (isEmpty(previewProfilesArray)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_0100 previewProfilesArray == null || undefined")
        expect(isEmpty(previewProfilesArray)).assertFalse();
      }
      previewOutput = cameraManager.createPreviewOutput(previewProfilesArray![0], surfaceIds);
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100
     * @tc.name      : Create photoOutput instance async api
     * @tc.desc      : Create photoOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100--------------");

      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      let photoProfilesArray = cameraOutputCap?.photoProfiles;
      if (isEmpty(photoProfilesArray)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 previewProfilesArray == null || undefined")
        expect().assertFalse();
      }
      photoOutput = cameraManager.createPhotoOutput(photoProfilesArray![0], surfaceId);
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100 data is empty");
        expect().assertFalse();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100
     * @tc.name      : Create videoOutput instance async api
     * @tc.desc      : Create videoOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_0100', 1, async (done: Function) => {
      await getVideoSurface();
      sleep(1000);
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100--------------");
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      console.info("SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 camera:" +
      cameraDevicesArray[0].cameraId + cameraDevicesArray[0].cameraPosition);
      expect(isEmpty(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 start createVideoOutput")
        videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
      } else {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      videoOutput.release();
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100
     * @tc.name      : Create metadataOutput instance async api
     * @tc.desc      : Create metadataOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100--------------");

      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      console.info("SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 camera:" +
      cameraDevicesArray[0].cameraId);
      expect(isEmpty(cameraOutputCap)).assertFalse();
      mMetadataObjectTypeArray = cameraOutputCap?.supportedMetadataObjectTypes;
      if (isEmpty(mMetadataObjectTypeArray) || mMetadataObjectTypeArray!.length < 1) {
        console.info("SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 end with mMetadataObjectTypeArray is null");
      } else {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_0100 start createMetadataOutput")
        metadataOutput = cameraManager.createMetadataOutput(mMetadataObjectTypeArray);
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100
     * @tc.name      : Create CaptureSession instance api
     * @tc.desc      : Create CaptureSession instance api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_0100', 1, async (done: Function) => {
      console.info(TAG + "--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100--------------");
      try {
        console.info(TAG + "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_0100")
        captureSession = cameraManager.createCaptureSession();
      } catch (error) {
        expect(isEmpty(error)).assertTrue();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100
     * @tc.name      : captureSession beginConfig
     * @tc.desc      : captureSession beginConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.beginConfig();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100
     * @tc.name      : captureSession addInput
     * @tc.desc      : captureSession addInput
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession.addInput(cameraInput)
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_0100
     * @tc.name      : captureSession add previewOutput
     * @tc.desc      : captureSession add previewOutput
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty(previewOutput)) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100 previewOutput == null || undefined")
          expect().assertFail();
        }
        captureSession.addOutput(previewOutput)
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100
     * @tc.name      : captureSession add photoOutput
     * @tc.desc      : captureSession add photoOutput
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty(photoOutput)) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_0100 photoOutput == null || undefined")
          expect().assertFail();
        }
        console.info(TAG + "captureSession start add photoOutput")
        captureSession.addOutput(photoOutput)
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100
     * @tc.name      : captureSession remove photoOutput
     * @tc.desc      : captureSession remove photoOutput
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100--------------");
      await getVideoSurface();
      sleep(1000);
      if (isEmpty(captureSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          captureSession.addOutput(videoOutput)
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
      }
      videoOutput.release();
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100
     * @tc.name      : captureSession add metadataOutput
     * @tc.desc      : captureSession add metadataOutput
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(captureSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (!isEmpty(metadataOutput)) {
          captureSession.addOutput(metadataOutput)
        }
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100
     * @tc.name      : captureSession commitConfig
     * @tc.desc      : captureSession commitConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 FAILED: " +
              err + err.code);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100
     * @tc.name      : Start metadataOutput type async api
     * @tc.desc      : Start metadataOutput type async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.on('metadataObjectsAvailable', async (err, data) => {
          if (!err) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 is not error");
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 success");
            mMetadataObjectArray = data;
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 ends here");
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.name      : metadata output callback on error api
     * @tc.desc      : metadata output callback on error api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100 metadata is not support")
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        metadataOutput.on('error', async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " +
            err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100
     * @tc.name      : captureSession start
     * @tc.desc      : captureSession start
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100
     * @tc.name      : Start metadataOutput type async api
     * @tc.desc      : Start metadataOutput type async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 ends here");
        })
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100
     * @tc.name      : Start metadataOutput type async api
     * @tc.desc      : Start metadataOutput type async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let type = mMetadataObjectArray[0].type;
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100 success, type : " + type);
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100
     * @tc.name      : Start metadataOutput timestamp async api
     * @tc.desc      : Start metadataOutput timestamp async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let timeStamp = mMetadataObjectArray[0].timestamp;
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100 success, timeStamp : " +
          timeStamp);
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100
     * @tc.name      : Start metadataOutput bounding box async api
     * @tc.desc      : Start metadataOutput bounding box async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100--------------");
      if (isEmpty(mMetadataObjectArray)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 mMetadataObjectArray == null || undefined")
      } else {
        let boundingBox = mMetadataObjectArray[0].boundingBox;
        let w = boundingBox.width;
        let h = boundingBox.height;
        let tx = boundingBox.topLeftX;
        let ty = boundingBox.topLeftY;
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 success, boundingBox : " + w + "x" +
          h);
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100 success, boundingBox : " + tx + "x" +
          ty);
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100
     * @tc.name      : Stop metadataOutput type async api
     * @tc.desc      : Stop metadataOutput type async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.stop(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100
     * @tc.name      : Create previewOutput instance promise api
     * @tc.desc      : Create previewOutput instance promise api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100--------------");
      try {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 start")
        previewOutput.start();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100 end")
      } catch (error) {
        expect(isEmpty(error)).assertTrue();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100
     * @tc.name      : Create previewOutput instance promise api
     * @tc.desc      : Create previewOutput instance promise api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 start")
        previewOutput.stop();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100 end")
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100
     * @tc.name      : Create previewOutput instance async api
     * @tc.desc      : Create previewOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.start(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100
     * @tc.name      : Create previewOutput instance async api
     * @tc.desc      : Create previewOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.stop(async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 success");
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 FAILED: " +
            err.message);
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100
     * @tc.name      : preview output callback on frameStart api
     * @tc.desc      : preview output callback on frameStart api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 to operate");
        let count = 0;
        previewOutput.on('frameStart', async (err, data) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 success");
            count++;
          } else {
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
        previewOutput.start();
        previewOutput.stop();
        // expect(count == 1).assertTrue();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100
     * @tc.name      : preview output callback on frameEnd api
     * @tc.desc      : preview output callback on frameEnd api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
        let count = 0;
        previewOutput.on('frameEnd', async (err, data) => {
          if (!err) {
            count++
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100 FAILED: " +
            err.message);
          }
          await sleep(1000);
          done();
        })
        previewOutput.stop();
        // expect(count == 1).assertTrue();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.name      : preview output callback on frameEnd api
     * @tc.desc      : preview output callback on frameEnd api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      if (isEmpty(previewOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        previewOutput.on('error', async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " +
            err.message);
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100
     * @tc.name      : check photoOutput is mirror supported with promise mode
     * @tc.desc      : check photoOutput is mirror supported with promise mode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        let isMirrorSupportedFlag = photoOutput.isMirrorSupported();
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100 isMirrorSupportedFlag = ' +
          isMirrorSupportedFlag);
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100
     * @tc.name      : photoOutput capture with promise mode
     * @tc.desc      : photoOutput capture with promise mode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100--------------");
      createPhotoSession(1);
      await addCommit(0, 1);
      await cameraSession.commitConfig();
      await sleep();
      await cameraSession.start();
      console.info(TAG +
        `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 +${photoOutput}`)
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        await photoOutput.capture().then(() => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 success');
        }).catch((err: BusinessError) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100 failed :' + err);
          expect().assertFail();
        });
      }
      await sleep(6000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100
     * @tc.name      : photoOutput commitConfig
     * @tc.desc      : captureSession commitConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100--------------");
      createPhotoSession(1);
      await addCommit(0, 1);
      await cameraSession.commitConfig();
      await sleep();
      await cameraSession.start();
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput.capture(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(6000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100
     * @tc.name      : photoOutput commitConfig
     * @tc.desc      : captureSession commitConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.quality = ' +
        captureSetting.quality);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.rotation = ' +
        captureSetting.rotation);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.latitude = ' +
        captureSetting.location!.latitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.longitude = ' +
        captureSetting.location!.longitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.location.altitude = ' +
        captureSetting.location!.altitude);
        console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 captureSetting.mirror = ' +
        captureSetting.mirror);

        await photoOutput.capture(captureSetting).then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 success :' + result);
        }).catch((err: BusinessError) => {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100 failed :' + err);
        });
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100
     * @tc.name      : photoOutput commitConfig
     * @tc.desc      : captureSession commitConfig
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100', 1, async (done: Function) => {
      try {
        console.info(TAG +
          " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100--------------");
        createPhotoSession(1);
        addCommit(0, 1);
        await cameraSession.commitConfig();
        await sleep();
        await cameraSession.start();
        if (isEmpty(photoOutput)) {
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 photoOutput == null || undefined")
          expect().assertFail();
        } else {
          photoOutput.capture(captureSetting, async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 FAILED: " +
              err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 ends here");
            await sleep(1000);
            done();
          })
        }
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100 ends here");
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
     * @tc.name      : photo output callback on captureStart
     * @tc.desc      : photo output callback on captureStart
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG + "Entering PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 to operate");
        let count = 0;
        photoOutput.on('captureStart', async (err, data) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100 FAILED: " +
            err.message);
          }
        })
        photoOutput.capture();
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100
     * @tc.name      : photo output callback on captureStart
     * @tc.desc      : photo output callback on captureStart
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 to operate");
        let count = 0;
        photoOutput.on('captureStartWithInfo', async (err, data: cameraObj.CaptureStartInfo) => {
          if (!err) {
            expect((!isEmpty(data.captureId)) && (!isEmpty(data.time))).assertTrue();
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG +
              "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100 FAILED: " +
            err.message);
          }
        })
        photoOutput.capture();
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100
     * @tc.name      : photo output callback on frameShutter
     * @tc.desc      : photo output callback on frameShutter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 to operate");
        let count = 0;
        photoOutput.on('frameShutter', async (err, data) => {
          if (!err) {
            count++;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 success");
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100, captureId = " +
            data.captureId);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100, timestamp = " +
            data.timestamp);
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100 FAILED: " +
            err.message);
          }
          await sleep(1000);
          done();
        })
        await sleep(1000);
        done();
        photoOutput.capture();

      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100
     * @tc.name      : photo output callback on captureEnd
     * @tc.desc      : photo output callback on captureEnd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 to operate");
        let count = 0;
        photoOutput.on('captureEnd', async (err, data) => {
          if (!err) {
            count++;
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 success");
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100, captureId = " +
            data.captureId);
            console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100, frameCount = " +
            data.frameCount);
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100 FAILED: " +
            err.message);
          }
        })
        await sleep(1000);
        done();
        photoOutput.capture();

      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100
     * @tc.name      : photo output callback on error
     * @tc.desc      : photo output callback on error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100--------------");
      if (isEmpty(photoOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 to operate");
        photoOutput.on('error', async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100
     * @tc.name      : videoOutput start promise api
     * @tc.desc      : videoOutput start promise api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 start")
          videoOutput.start();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 end")
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100 error`)
      }
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100
     * @tc.name      : videoOutput stop promise api
     * @tc.desc      : videoOutput stop promise api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 start")
          videoOutput.stop();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 end")
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100 error`);
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100
     * @tc.name      : Start metadataOutput sync api
     * @tc.desc      : Start metadataOutput sync api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.start().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 success :' + result);
        }).catch((err: BusinessError) => {
          console.info('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 failed :' + err);
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100 ends here");
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100
     * @tc.name      : Stop metadataOutput sync api
     * @tc.desc      : Stop metadataOutput aync api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100', 1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.stop().then((result) => {
          console.info('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 success :' + result);
        }).catch((err: BusinessError) => {
          console.info('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 failed :' + err);
        });
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100 ends here");
      }
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100
     * @tc.name      : videoOutput start async api
     * @tc.desc      : videoOutput start async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.start(async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 success");
            } else {
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 FAILED: " +
              err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 ends here");
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput?.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100 error`);
        done();
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100
     * @tc.name      : videoOutput stop async api
     * @tc.desc      : videoOutput stop async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.stop(async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 FAILED: " +
              err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 ends here");
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100 error`)
      }
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100
     * @tc.name      : video output callback on frameStart api
     * @tc.desc      : video output callback on frameStart api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100', 1, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100--------------");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 to operate");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.on('frameStart', async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100 error`);
      }
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100
     * @tc.name      : video output callback on frameEnd api
     * @tc.desc      : video output callback on frameEnd api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100', 1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 to operate");
      await getVideoSurface();
      sleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
        videoOutput.on('frameEnd', async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 FAILED: " +
            err.message);
          }
        })
      } else {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      videoOutput.release();
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100
     * @tc.name      : video output callback on error api
     * @tc.desc      : video output callback on error api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100', 1, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100--------------");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 to operate");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.on('error', async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100 error`);
        done();
      }

    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100
     * @tc.name      : Create previewOutput instance async api
     * @tc.desc      : Create previewOutput instance async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100', 1, async (done: Function) => {
      try {
        console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100--------------");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          photoOutput.release(async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 FAILED: " +
              err.message);
            }
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 ends here");
            await sleep(1000);
            done();
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100 error`);
      }
    })
  })

}
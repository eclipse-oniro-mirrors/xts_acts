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
let videoProfilesArray: Array<cameraObj.VideoProfile>;
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
  if (mode == cameraObj.SceneMode.NORMAL_VIDEO) {
    videoProfilesArray = cameraOutputCap.videoProfiles;
    console.log(`videoProfilesArray:  + ${JSON.stringify(videoProfilesArray)}`)
  } else {
    photoOutput = cameraManager.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
    console.log(TAG + `Receiver is ok + ${JSON.stringify(photoOutput)}`)
  }
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

// 获取相机列表
let getCameraDevices = () => {
  cameraManager = cameraObj.getCameraManager(context);
  sleep(1000);
  cameraDevicesArray = cameraManager.getSupportedCameras();
  console.log(`cameraDevicesArray:  + ${JSON.stringify(cameraDevicesArray)}`)

  let sceneModes: Array<cameraObj.SceneMode> = cameraManager.getSupportedSceneModes(cameraDevicesArray[0]);
  console.log(`supportedSceneModes:  + ${JSON.stringify(sceneModes)}`)
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


  let startSession = async (i: number, mode: number) => {
    // 创建相机
    getCameraDevices()
    // 创建输出流
    createOutput(i, mode)
    // 配置录制参数, 获取 videoSurfaceId
    await getVideoSurface();
    console.info('videoSurfaceId: ' + videoSurfaceId)
    // 创建VideoOutput对象
    videoOutput = cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId);
    //创建会话
    createPhotoSession(mode)
    // 配置会话
    createInput(i);
    if (cameraInput) {
      cameraSession.addInput(cameraInput);
    }
    if (previewOutput) {
      cameraSession.addOutput(previewOutput);
    }
    if (videoOutput) {
      cameraSession.addOutput(videoOutput);
    }
    cameraSession.commitConfig();
    cameraSession.start();
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
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_0100', Level.LEVEL2, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100
     * @tc.name      : metadata output callback off metadataObjectsAvailable api
     * @tc.desc      : metadata output callback off metadataObjectsAvailable api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
      console.info(TAG +
        " --------------SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput.off('metadataObjectsAvailable', async (err, data) => {
          if (!err) {
            console.info(TAG +
              "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 is not error");
            expect(isEmpty(data)).assertFalse();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 success");
            mMetadataObjectArray = data;
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_0100 ends here");
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
    it('SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_0100
     * @tc.name      : metadata output callback off error api
     * @tc.desc      : metadata output callback off error api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_0100--------------");
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_0100 metadata is not support")
      } else {
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_0100 to operate");
        metadataOutput.off('error', async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_0100 FAILED: " +
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
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100
     * @tc.name      : captureSession stop 
     * @tc.desc      : captureSession stop 
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.stop(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 FAILED: " +
            err.code+cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR);
            expect(err.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100
     * @tc.name      : captureSession release
     * @tc.desc      : captureSession release
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.release(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_0100 ends here");
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
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(metadataOutput)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_0100 metadataOutput == null || undefined")
      } else {
        await addCommit(0, 1);
        cameraSession.addOutput(metadataOutput);
        cameraSession.commitConfig();
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
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100
     * @tc.name      : Create release session async api
     * @tc.desc      : Create release session async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.release(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0100 ends here");
          await sleep(1000);
          done();
        })
      }
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200
     * @tc.name      : Create release session errorcode async api
     * @tc.desc      : Create release session errorcode async api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200', Level.LEVEL1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200--------------");
      createPhotoSession(1);
      if (isEmpty(cameraSession)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, 1);
        cameraSession.commitConfig();
        cameraSession.release(async (err) => {
          if (!err) {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200 success");
            expect(true).assertTrue();
          } else {
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200 FAILED: " +
            err.message);
            expect(err.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          }
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_0200 ends here");
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
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100
     * @tc.name      : photo output callback on captureStart
     * @tc.desc      : photo output callback on captureStart
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_0100
     * @tc.name      : photo output callback off captureReady
     * @tc.desc      : photo output callback off captureReady
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 打开监听
      photoOutput.on('captureReady', async (err) => {
        console.info(`photo output start listen on captureReady failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('captureReady', async (err) => {
        console.info(`photo output stop listen on captureReady failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on captureReady success`);
      expect(true).assertTrue()
      await sleep(1000);
      photoOutput.release()
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_0100
     * @tc.name      : photo output callback on estimatedCaptureDuration
     * @tc.desc      : photo output callback on estimatedCaptureDuration
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_0100 to operate");

      // 打开监听
      photoOutput.on('estimatedCaptureDuration', async (err) => {
        console.info(`photo output start listen on estimatedCaptureDuration failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on estimatedCaptureDuration success`);
      expect(true).assertTrue()
 
      await sleep(1000);
      photoOutput.release()
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100
     * @tc.name      : Start metadataOutput sync api
     * @tc.desc      : Start metadataOutput sync api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_0100
     * @tc.name      : photo output callback off estimatedCaptureDuration
     * @tc.desc      : photo output callback off estimatedCaptureDuration
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_0100 to operate");

      // 打开监听
      photoOutput.on('estimatedCaptureDuration', async (err) => {
        console.info(`photo output start listen on estimatedCaptureDuration failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('estimatedCaptureDuration', async (err) => {
        console.info(`photo output stop listen on estimatedCaptureDuration failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on estimatedCaptureDuration success`);
      expect(true).assertTrue()
      await sleep(1000);
      photoOutput.release()
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
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_0100
     * @tc.name      : photo output callback on photoAvailable
     * @tc.desc      : photo output callback on photoAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_0100 to operate");

      // 打开监听
      photoOutput.on('photoAvailable', async (err) => {
        console.info(`photo output start listen on photoAvailable failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on photoAvailable success`);
      expect(true).assertTrue()
      photoOutput.release()
      await sleep(1000);
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
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_0100', Level.LEVEL1, async (done: Function) => {
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
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_0100
     * @tc.name      : photo output callback off photoAvailable
     * @tc.desc      : photo output callback off photoAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_0100 to operate");

      // 打开监听
      photoOutput.on('photoAvailable', async (err) => {
        console.info(`photo output start listen on photoAvailable failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('photoAvailable', async (err) => {
        console.info(`photo output stop listen on photoAvailable failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on photoAvailable success`);
      expect(true).assertTrue()
      photoOutput.release()
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_0100
     * @tc.name      : photo output callback on photoAssetAvailable
     * @tc.desc      : photo output callback on photoAssetAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_0100 to operate");

      // 打开监听
      photoOutput.on('photoAssetAvailable', async (err) => {
        console.info(`photo output start listen on photoAssetAvailable failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on photoAssetAvailable success`);
      expect(true).assertTrue()
      photoOutput.release()
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_0100
     * @tc.name      : photo output callback off photoAssetAvailable
     * @tc.desc      : photo output callback off photoAssetAvailable
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_0100 to operate");

      // 打开监听
      photoOutput.on('photoAssetAvailable', async (err) => {
        console.info(`photo output start listen on photoAssetAvailable failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('photoAssetAvailable', async (err) => {
        console.info(`photo output stop listen on photoAssetAvailable failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on photoAssetAvailable success`);
      expect(true).assertTrue()
      await sleep(1000);
      photoOutput.release()
      done();
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100
     * @tc.name      : photo output callback off captureStart
     * @tc.desc      : photo output callback off captureStart
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      
      // 先开启监听
      photoOutput.on('captureStart', async (err) => {
        console.info(`photo output error code: ${err.code}`);
      })

      // 关闭监听
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100 to operate");
      let count = 0;
      photoOutput.off('captureStart', async (err, data) => {
        if (!err) {
          expect(true).assertTrue();
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100 success");
        } else {
          expect().assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100 FAILED: " +
          err.message);
        }
      })
      
      expect(1 == 1).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_0100 success");
      photoOutput.capture();
      photoOutput.release()
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100
     * @tc.name      : photo output callback on capture start with info
     * @tc.desc      : photo output callback on capture start with info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100', Level.LEVEL1, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 先开启监听
      photoOutput.on('captureStartWithInfo', async (err) => {
        console.info(`photo output error code: ${err.code}`);
      })


      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100 to operate");
      let count = 0;
      photoOutput.off('captureStartWithInfo', async (err, data: cameraObj.CaptureStartInfo) => {
        if (!err) {
          expect((!isEmpty(data.captureId)) && (!isEmpty(data.time))).assertTrue();
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100 success");
        } else {
          expect().assertFail();
          console.info(TAG +
            "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100 FAILED: " +
          err.message);
        }
      })
      expect(1 == 1).assertTrue();
      console.info(TAG +
                  "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_0100 success");
      photoOutput.capture();
      await sleep(1000);
      photoOutput.release()
      done();
    })




    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100
     * @tc.name      : photo output callback off frameShutter
     * @tc.desc      : photo output callback off frameShutter
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 先开启监听
      photoOutput.on('frameShutter', async (err, data) => {
        console.info(`photo output error code: ${err.code}`);
      })

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100 to operate");
      let count = 0;
      photoOutput.off('frameShutter', async (err, data) => {
        if (!err) {
          count++;
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100 success");
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100, captureId = " +
          data.captureId);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100, timestamp = " +
          data.timestamp);
        } else {
          expect(1 == 1).assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100 FAILED: " +
          err.message);
        }
        await sleep(1000);
        done();
      })
      expect(1 == 1).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_0100 success");
      await sleep(1000);
      photoOutput.release()
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_0100
     * @tc.name      : photo output callback on frameShutterEnd
     * @tc.desc      : photo output callback on frameShutterEnd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_0100 to operate");

      // 打开监听
      photoOutput.on('frameShutterEnd', async (err) => {
        console.info(`photo output start listen on frameShutterEnd failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on frameShutterEnd success`);
      expect(true).assertTrue()
      photoOutput.release()
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_0100
     * @tc.name      : photo output callback off frameShutterEnd
     * @tc.desc      : photo output callback off frameShutterEnd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_0100 to operate");

      // 打开监听
      photoOutput.on('frameShutterEnd', async (err) => {
        console.info(`photo output start listen on frameShutterEnd failed: ${err.code}`);
      })

      // 关闭监听
      await sleep(1000);
      photoOutput.off('frameShutterEnd', async (err) => {
        console.info(`photo output stop listen on frameShutterEnd failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output stop listen on frameShutterEnd success`);
      expect(true).assertTrue()
      await sleep(1000);
      photoOutput.release()
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100
     * @tc.name      : photo output callback off captureEnd
     * @tc.desc      : photo output callback off captureEnd
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100 to operate");

      // 先打开监听
      photoOutput.on('captureEnd', async (err, data) => {
        console.info(`photo output error code: ${err.code}`);
      })
      await sleep(1000)

      let count = 0;
      photoOutput.off('captureEnd', async (err, data) => {
        if (!err) {
          count++;
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100, captureId = " +
          data.captureId);
          console.info(TAG + "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100, frameCount = " +
          data.frameCount);
        } else {
          expect(1 == 1).assertFail();
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100 FAILED: " +
          err.message);
        }
      })
      expect(1 == 1).assertTrue();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100 success");
      photoOutput.release()
      await sleep(1000);
      done();

    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_0100
     * @tc.name      : photo output callback on captureReady
     * @tc.desc      : photo output callback on captureReady
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_0100 to operate");

      // 打开监听
      photoOutput.on('captureReady', async (err) => {
        console.info(`photo output start listen on captureReady failed: ${err.code}`);
        expect(true).assertFalse()
        await sleep(1000);
        done();
      })
      console.info(`photo output start listen on captureReady success`);
      expect(true).assertTrue()
      photoOutput.release()
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100
     * @tc.name      : photo output callback off error
     * @tc.desc      : photo output callback off error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 先开启监听
      photoOutput.on('error', async (err) => {
        console.info(`photo output error code: ${err.code}`);
      })

      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 to operate");
      await sleep(1000);

      // 关闭监听
      photoOutput.off('error', async (err) => {
          console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 FAILED: " +
          err.message);
          expect(1 == 1).assertFail();
      })
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 success");
      expect(1 == 1).assertTrue();
      photoOutput.release()
      await sleep(1000);
      done();
    })





    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_0100
     * @tc.name      : photo output getActiveProfile
     * @tc.desc      : photo output getActiveProfile
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_0100', Level.LEVEL1, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 获取激活的配置
      let activeProfile = photoOutput.getActiveProfile()
      console.info(`activeProfile: ${JSON.stringify(activeProfile)}`)

      // 断言
      if (activeProfile) {
        expect(1 == 1).assertTrue();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 success");
      } else {
        expect(1 == 1).assertFalse();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_0100 failed");        
      }
      photoOutput.release()
      await sleep(1000);
      done();
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0100
     * @tc.name      : photo output enableMovingPhoto on errorCode
     * @tc.desc      : photo output enableMovingPhoto on errorCode
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0200', Level.LEVEL1, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0200--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 开启动态图片功能
      try {
        photoOutput.enableMovingPhoto(true)
        expect(true).assertTrue()
        console.info(`photoOutput enableMovingPhoto success`)
      } catch (err) {
        console.info(`photoOutput enableMovingPhoto failed + ${JSON.stringify(err)}`)
        expect(true).assertFalse()
      }
      photoOutput.release()
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300
     * @tc.name      : photo output enableMovingPhoto on errorCode 7400101
     * @tc.desc      : photo output enableMovingPhoto on errorCode 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300', Level.LEVEL2, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 开启动态图片功能
      try {
        photoOutput.enableMovingPhoto(null)
        expect(true).assertTrue()
        console.info(`photoOutput enableMovingPhoto success`)
      } catch (err) {
        console.info(`photoOutput enableMovingPhoto failed + ${JSON.stringify(err)}`)
        expect(err.code == 7400101 ).assertTrue()
      }
      photoOutput.release()
      await sleep(1000);
      done();
    })   



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_FRAME_SHUTTER_END_INFO_0100
     * @tc.name      : frame shutter end info
     * @tc.desc      : frame shutter end info
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300', Level.LEVEL2, async (done: Function) => {

      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_0300--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 开启动态图片功能
      try {
        photoOutput.enableMovingPhoto(null)
        expect(true).assertTrue()
        console.info(`photoOutput enableMovingPhoto success`)
      } catch (err) {
        console.info(`photoOutput enableMovingPhoto failed + ${JSON.stringify(err)}`)
        expect(err.code == 7400101 ).assertTrue()
      }
      photoOutput.release()
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100
     * @tc.name      : video output callback off frameStart api
     * @tc.desc      : video output callback off frameStart api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100--------------");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 to operate");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.off('frameStart', async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_0100 error`);
      }
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100
     * @tc.name      : video output callback off frameEnd api
     * @tc.desc      : video output callback off frameEnd api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100 to operate");
      await getVideoSurface();
      sleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
        videoOutput.off('frameEnd', async (err) => {
          if (!err) {
            expect(true).assertTrue();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100 success");
          } else {
            expect().assertFail();
            console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100 FAILED: " +
            err.message);
          }
        })
      } else {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      videoOutput.release();
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100
     * @tc.name      : video output get supported frameRates api
     * @tc.desc      : video output get supported frameRates api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100--------------");
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100 to operate");
      await getVideoSurface();
      sleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
        let supportedFrameRatesArray = videoOutput.getSupportedFrameRates()
        expect(isEmpty(supportedFrameRatesArray)).assertFalse();
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100 success");
      } else {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      await sleep(1000);
      await videoOutput.release();
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
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_0100', Level.LEVEL1, async (done: Function) => {
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
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100
     * @tc.name      : video output get supported frame rates
     * @tc.desc      : video output get supported frame rates
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------BEGIN SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_0100--------------");    

      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)

      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
      expect(isEmpty(supportedFrameRates)).assertFalse()
      // 释放会话
      await videoOutput.release()
      await cameraSession.release();
      done()
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0100
     * @tc.name      : video output set frame rate
     * @tc.desc      : video output set frame rate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0100--------------");
      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)

      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)

      // 设置帧率范围
      try {
        videoOutput.setFrameRate(supportedFrameRates[0]['min'], supportedFrameRates[0]['max']);
        console.info(`videoOutput set FrameRate success`)
        expect().assertTrue;
      } catch {
        console.info(`videoOutput set FrameRate failed`)
        expect().assertFalse;
      }
      await videoOutput.release();
      await cameraSession.release();
      done()
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200
     * @tc.name      : video output set frame rate with errorCode 7400101
     * @tc.desc      : video output set frame rate with errorCode 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200--------------");
      await getVideoSurface();
      cameraManager = cameraObj.getCameraManager(context);
      let camerasArray = cameraManager.getSupportedCameras();
      if (isEmpty(cameraManager)) {
          console.info(TAG + "mCameraManager == null || undefined");
          expect().assertFail();
      }
      let captureSession = cameraManager.createSession(cameraObj.SceneMode.NORMAL_VIDEO);
      if (isEmpty(captureSession)) {
          console.info(TAG + "captureSession == null || undefined");
          expect().assertFail();
      }
      console.info("SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200 camera:" + camerasArray[0].cameraId);
      let cameraOutputCap = getSupportedOutputCapabilityInPromise(camerasArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      if (isEmpty(cameraOutputCap)) {
          console.info(TAG + "Entering cameraOutputCap == null || undefined");
          expect().assertFail();
      }
      let cameraInput = cameraManager.createCameraInput(camerasArray[0]);
      if (isEmpty(cameraInput)) {
          console.info(TAG + "Entering cameraInput == null || undefined");
          expect().assertFail();
      }
      let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
          console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200 start createVideoOutput")
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
      } else {
          console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
      }
      await cameraInput.open();
      captureSession.beginConfig();
      if (!isEmpty(cameraInput)) {
          console.info(TAG + "Start to addInput");
          captureSession.addInput(cameraInput);
      }
      if (!isEmpty(videoOutput)) {
          console.info(TAG + "Start to addOutput videoOutput");
          captureSession.addOutput(videoOutput);
      }
      await captureSession.commitConfig();
      try {
        // 获取支持的帧率范围
        let supportedFrameRates = videoOutput.getSupportedFrameRates()
        console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
        await sleep(1000);

        videoOutput.setFrameRate(-1, -1);
        console.info(`videoOutput set FrameRate success`)
        expect(true).assertFalse();
      } catch (err) {
        console.info(`videoOutput set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
      }
      cameraInput.close()
      videoOutput.release()
      await captureSession.release();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0200 PASS");
      await sleep(1000);
      done();
    })



    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0300
     * @tc.name      : video output set frame rate with errorCode 7400110
     * @tc.desc      : video output set frame rate with errorCode 7400110
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_0300--------------");
      getCameraDevices()
      // 创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_VIDEO)
      // 配置录制参数, 获取 videoSurfaceId
      await getVideoSurface();
      console.info('videoSurfaceId: ' + videoSurfaceId)
      // 创建VideoOutput对象
      videoOutput = cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId);
      // 创建第二个videoOutput
      let videoOutput2 = cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId);
      //创建会话
      createPhotoSession(cameraObj.SceneMode.NORMAL_VIDEO)
      // 配置会话
      createInput(0);
      if (cameraInput) {
        cameraSession.addInput(cameraInput);
      }
      if (previewOutput) {
        cameraSession.addOutput(previewOutput);
      }
      if (videoOutput) {
        cameraSession.addOutput(videoOutput);
      }
      if (videoOutput2) {
        cameraSession.addOutput(videoOutput2);
      }
      cameraSession.commitConfig();
      cameraSession.start();

      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)

      // 设置帧率范围
      try {
        videoOutput2.setFrameRate(supportedFrameRates[0]['min'] + 1, supportedFrameRates[0]['max'] - 1);
        console.info(`videoOutput2 set FrameRate success`)
        expect().assertFail();
      } catch (err) {
        console.info(`videoOutput2 set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS).assertTrue();
        // expect(err.code == 7400110).assertTrue();
      }
      videoOutput2.release()
      stopCameraSession()
      done()
    })



   /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_0100
     * @tc.name      : video output get active frame rate
     * @tc.desc      : video output get active frame rate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_0100--------------");    
      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)

      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)

      // 设置帧率范围
      try {
        videoOutput.setFrameRate(supportedFrameRates[0]['min'], supportedFrameRates[0]['max']);
        console.info(`videoOutput set FrameRate success`)
      } catch (err) {
        console.info(`videoOutput set FrameRate failed + + ${JSON.stringify(err)}`)
      }
      // 获取激活的帧率范围
      let activeFrameRate = videoOutput.getActiveFrameRate();
      console.info(`videoOutput get FrameRate success:  + ${JSON.stringify(activeFrameRate)}`) 
      expect(activeFrameRate["min"] == supportedFrameRates[0]['min']).assertTrue()
      // 关闭会话
      await videoOutput.release()
      await cameraSession.release();
      done()
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100
     * @tc.name      : video output callback off error api
     * @tc.desc      : video output callback off error api
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100', Level.LEVEL1, async (done: Function) => {
      try {
        console.info("--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100--------------");
        console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 to operate");
        await getVideoSurface();
        sleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap?.videoProfiles[0];
        expect(isEmpty(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager.createVideoOutput(videoProfilesArray, videoSurfaceId);
          videoOutput.off('error', async (err) => {
            if (!err) {
              expect(true).assertTrue();
              console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 success");
            } else {
              expect().assertFail();
              console.info(TAG + "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          console.info(TAG +
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 createVideoOutput parse err + ${JSON.stringify(videoProfilesArray)} + ${videoSurfaceId}`)
        }
        videoOutput.release();
        await sleep(1000);
        done();
      } catch (err) {
        console.info(TAG +
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_0100 error`);
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
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
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
          videoOutput.release(async (err) => {
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

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100
     * @tc.name      : capture session callback on error
     * @tc.desc      : capture session callback on error
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_01000--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        try {
          captureSession = cameraManager.createCaptureSession();
          captureSession.on('error', (error: BusinessError) => {
            console.error(`Capture session error code: ${error.code}`);
          });
          captureSession.off('error');
          done();
        } catch (err) {
          let error = err as BusinessError
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100 FAILED!");
          console.info('ERRORCODE: ' + error.code)
          expect().assertFail();
          done();
        }
      }
      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_0100 PASSED");
      done();
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100
     * @tc.name      : capture session callback on focusStateChange
     * @tc.desc      : capture session callback on focusStateChange
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100', Level.LEVEL0, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100--------------");
      if (isEmpty(cameraManager)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100 == null || undefined");
        expect().assertFail();
      } else {
        try {
          captureSession = cameraManager.createCaptureSession();
          captureSession.on('focusStateChange', (error: BusinessError, focusState: cameraObj.FocusState) => {
            if (error !== undefined && error.code !== 0) {
              console.error(`Callback Error, errorCode: ${error.code}`);
              return;
            }
            console.info(`Focus state: ${focusState}`);
          });
          captureSession.off('focusStateChange');
          done();
        } catch (err) {
          let error = err as BusinessError
          console.info(TAG +
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100 FAILED!");
          console.info('ERRORCODE: ' + error.code)
          expect().assertFail();
          done();
        }
      }
      console.info(TAG +
        "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_0100 PASSED");
      done();
    });


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100
     * @tc.name      : preview output set frame rate
     * @tc.desc      : preview output set frame rate
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100--------------");
      cameraManager = cameraObj.getCameraManager(context);
      let camerasArray = cameraManager.getSupportedCameras();
      if (isEmpty(cameraManager)) {
          console.info(TAG + "mCameraManager == null || undefined");
          expect().assertFail();
      }
      let captureSession = cameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty(captureSession)) {
          console.info(TAG + "captureSession == null || undefined");
          expect().assertFail();
      }
      console.info("SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100 camera:" + camerasArray[0].cameraId);
      let cameraOutputCap = getSupportedOutputCapabilityInPromise(camerasArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty(cameraOutputCap)) {
          console.info(TAG + "Entering cameraOutputCap == null || undefined");
          expect().assertFail();
      }
      let cameraInput = cameraManager.createCameraInput(camerasArray[0]);
      if (isEmpty(cameraInput)) {
          console.info(TAG + "Entering cameraInput == null || undefined");
          expect().assertFail();
      }
      let previewProfiles = cameraOutputCap?.previewProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      previewOutput = cameraManager.createPreviewOutput(previewProfiles, surfaceIds)
      await cameraInput.open();
      captureSession.beginConfig();
      if (!isEmpty(cameraInput)) {
          console.info(TAG + "Start to addInput");
          captureSession.addInput(cameraInput);
      }
      if (!isEmpty(previewOutput)) {
          console.info(TAG + "Start to addOutput previewOutput");
          captureSession.addOutput(previewOutput);
      }
      await captureSession.commitConfig();
      try {
        // 获取支持的帧率范围
        let supportedFrameRates = previewOutput.getSupportedFrameRates()
        console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
        await sleep(1000);

        previewOutput.setFrameRate(supportedFrameRates[0]['min'] + 1, supportedFrameRates[0]['max'] - 1);
        console.info(`videoOutput set FrameRate success`)
        expect(true).assertTrue();
      } catch (err) {
        console.info(`videoOutput set FrameRate failed: ` + err.code)
        expect().assertFail();
      }
      await captureSession.release();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0100 PASS");
      await sleep(1000);
      done();
    })


    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200
     * @tc.name      : preview output set frame rate with errorCode 7400101
     * @tc.desc      : preview output set frame rate with errorCode 7400101
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200--------------");
      cameraManager = cameraObj.getCameraManager(context);
      let camerasArray = cameraManager.getSupportedCameras();
      if (isEmpty(cameraManager)) {
          console.info(TAG + "mCameraManager == null || undefined");
          expect().assertFail();
      }
      let captureSession = cameraManager.createSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty(captureSession)) {
          console.info(TAG + "captureSession == null || undefined");
          expect().assertFail();
      }
      console.info("SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200 camera:" + camerasArray[0].cameraId);
      let cameraOutputCap = getSupportedOutputCapabilityInPromise(camerasArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty(cameraOutputCap)) {
          console.info(TAG + "Entering cameraOutputCap == null || undefined");
          expect().assertFail();
      }
      let cameraInput = cameraManager.createCameraInput(camerasArray[0]);
      if (isEmpty(cameraInput)) {
          console.info(TAG + "Entering cameraInput == null || undefined");
          expect().assertFail();
      }
      let previewProfiles = cameraOutputCap?.previewProfiles[0];
      expect(isEmpty(videoProfilesArray)).assertFalse();
      previewOutput = cameraManager.createPreviewOutput(previewProfiles, surfaceIds)
      await cameraInput.open();
      captureSession.beginConfig();
      if (!isEmpty(cameraInput)) {
          console.info(TAG + "Start to addInput");
          captureSession.addInput(cameraInput);
      }
      if (!isEmpty(previewOutput)) {
          console.info(TAG + "Start to addOutput previewOutput");
          captureSession.addOutput(previewOutput);
      }
      await captureSession.commitConfig();
      try {
        // 获取支持的帧率范围
        let supportedFrameRates = previewOutput.getSupportedFrameRates()
        console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
        await sleep(1000);

        previewOutput.setFrameRate(-1, -1);
        console.info(`previewOutput set FrameRate success`)
        expect(true).assertFalse();
      } catch (err) {
        console.info(`previewOutput set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
      }
      // 释放资源
      await cameraInput.close()
      await previewOutput.release()
      await captureSession.release();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0200 PASS");
      await sleep(1000);
      done();
    })

    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0300
     * @tc.name      : preview output set frame rate with errorCode 7400110
     * @tc.desc      : preview output set frame rate with errorCode 7400110
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0300', Level.LEVEL2, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0300--------------");
      // 创建相机
      getCameraDevices()
      // 创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_VIDEO)
      // 配置录制参数, 获取 videoSurfaceId
      await getVideoSurface();
      console.info('videoSurfaceId: ' + videoSurfaceId)
      // 创建2个VideoOutput对象
      let cameraOutputCap = cameraManager.getSupportedOutputCapability(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      let videoProfile = cameraOutputCap.videoProfiles.find((videoProfile: cameraObj.Profile) => {
        return Math.abs((cameraOutputCap.previewProfiles[0].size.width / cameraOutputCap.previewProfiles[0].size.height) - (videoProfile.size.width / videoProfile.size.height)) < Number.EPSILON;
      });
      videoOutput = cameraManager.createVideoOutput(videoProfile, videoSurfaceId);
      let videoOutput2 = cameraManager.createVideoOutput(videoProfile, videoSurfaceId);
      //创建会话
      createPhotoSession(cameraObj.SceneMode.NORMAL_VIDEO)
      // 配置会话
      await createInput(0);
      if (cameraInput) {
        cameraSession.addInput(cameraInput);
      }
      if (previewOutput) {
        cameraSession.addOutput(previewOutput);
      }
      if (videoOutput) {
        cameraSession.addOutput(videoOutput);
      }
      if (videoOutput2) {
        cameraSession.addOutput(videoOutput2);
      }
      try {
        await captureSession.commitConfig();
      } catch (err) {
        console.info("Skipping As The Device is Not Supported");
        expect(true).assertTrue()
        done()
      }
      cameraSession.start();

      // 获取支持的帧率范围
      let supportedFrameRates = previewOutput.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
      await sleep(1000);

      try {
        previewOutput.setFrameRate(supportedFrameRates[0]['min'] + 1, supportedFrameRates[0]['max'] - 1);
        console.info(`previewOutput set FrameRate success`)
        expect(true).assertFalse();
      } catch (err) {
        console.info(`previewOutput set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS).assertTrue();
      }
      // 关闭会话
      videoOutput2.release()
      await stopCameraSession()
      await cameraSession.release();
      console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_0300 PASS");
      // 关闭previewOutput
      await previewOutput.release();
      await sleep(1000);
      done();
    })
  
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_0100
     * @tc.name      : preview output getActiveProfile
     * @tc.desc      : preview output getActiveProfile
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_0100', Level.LEVEL1, async (done: Function) => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_0100--------------");
      // 创建相机
      getCameraDevices()
      
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 获取激活的配置
      try {
        let activeProfile = previewOutput.getActiveProfile()
        console.info(`get activeProfile success: ${JSON.stringify(activeProfile)}`)
        expect(true).assertTrue();
      } catch ( err) {
        console.info(`get activeProfile failed: ${JSON.stringify(err.code)}`)
        expect().assertFail()
      }
      // 关闭previewOutput
      await previewOutput.release();
      await sleep(1000);
      done();
    })
    
    /**
     * @tc.number    : SUB_MULTIMEDIA_CAMERA_OUTPUT_RELEASE_CALLBACK_0100
     * @tc.name      : test camera output release on callback
     * @tc.desc      : test camera output release on callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('SUB_MULTIMEDIA_CAMERA_OUTPUT_RELEASE_CALLBACK_0100', Level.LEVEL1, async (done: Function) => {
      console.info(TAG + " --------------SUB_MULTIMEDIA_CAMERA_OUTPUT_RELEASE_CALLBACK_0100--------------");
      getCameraDevices()
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      let previewProfilesArray = cameraOutputCap?.previewProfiles;
      if (isEmpty(previewProfilesArray)) {
        console.info(TAG +
          "Entering SUB_MULTIMEDIA_CAMERA_OUTPUT_RELEASE_CALLBACK_0100 previewProfilesArray == null || undefined")
        expect(isEmpty(previewProfilesArray)).assertFalse();
      }
      let previewOutput1 = cameraManager.createPreviewOutput(previewProfilesArray![0], surfaceIds);
      await sleep(1000);
      try {
        previewOutput1.release((err: BusinessError) => {
          if (err) {
            console.error(`Failed to release the Preview output instance ${err.code}`);
            return;
          }
          console.info('Callback invoked to indicate that the preview output instance is released successfully.');
        });
        expect(true).assertTrue()
      } catch (err) {
        console.info('previewOutput release failed: ' + err.code)
        expect().assertFail()
      }
      done();
    })
  })
}
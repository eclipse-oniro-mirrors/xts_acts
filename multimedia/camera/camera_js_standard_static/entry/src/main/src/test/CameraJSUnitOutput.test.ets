/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
import { BusinessError } from '@ohos.base';
import { Driver, MatchPattern, ON } from '@ohos.UiTest';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import hilog from "@ohos.hilog";
import Utils from './Util.test';
import Context from "application.Context";
import photoAccessHelper from '@ohos.file.photoAccessHelper';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'CameraUnitTest: '; //日志标识字符串,作为tag标识当前runner类下的测试行为

let captureLocation: cameraObj.Location = {
  latitude: 0.0,
  longitude: 0.0,
  altitude: 0.0,
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
  audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC,
  videoSourceType: media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV,
  profile: videoProfile,
  url: 'file:///data/media/CameraJSUnitOutput.mp4',
}

// 创建录像输出流
let AVRecorder: media.AVRecorder | undefined;
let surfaceIds: string = "";
let surfaceId: string = "";
let cameraManager: cameraObj.CameraManager | undefined;
let cameraDevicesArray: Array<cameraObj.CameraDevice> = [];
let captureSession: cameraObj.VideoSession | undefined;
let cameraSession: cameraObj.Session | undefined;
let cameraInput: cameraObj.CameraInput | undefined;
let previewOutput: cameraObj.PreviewOutput | undefined;
let photoOutput: cameraObj.PhotoOutput | undefined;
let videoOutput: cameraObj.VideoOutput | undefined;
let metadataOutput: cameraObj.MetadataOutput | null = null;
let videoSurfaceId: string | undefined;
let receiver: image.ImageReceiver | undefined;
let videoProfilesArray: Array<cameraObj.VideoProfile> = [];
let mMetadataObjectTypeArray: Array<cameraObj.MetadataObjectType>;
let mMetadataObjectArray: Array<cameraObj.MetadataObject> | undefined = undefined;

let mPhotoSurface: string = "";
let getPhotoReceiverSurface = async () => {
  hilog.info(domain, tag, 'Entering getPhotoReceiverSurface')
  receiver = image.createImageReceiver({height:960, width:1280} as image.Size, image.ImageFormat.JPEG, 8)
  hilog.info(domain, tag, 'before receiver check')
  if (receiver !== undefined) {
    hilog.info(domain, tag, 'Photo receiver is created successfully')
    mPhotoSurface = await receiver!.getReceivingSurfaceId()
    hilog.info(domain, tag, 'Photo received id: ' + JSON.stringify(mPhotoSurface))
  } else {
    hilog.info(domain, tag, 'Photo receiver is created failed')
  }
  hilog.info(domain, tag, 'Exit getPhotoReceiverSurface')
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

let isEmpty03 = (data: cameraObj.VideoSession) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty04 = (data: cameraObj.CameraInput) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty05 = (data: cameraObj.CameraOutputCapability) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty06 = (data: Array<cameraObj.Profile>) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty07 = (data: cameraObj.PreviewOutput) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty08 = (data: BusinessError) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty09 = (data: cameraObj.CameraOutputCapability) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty10 = (data: cameraObj.CameraDevice) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty15 = (data: cameraObj.PhotoOutput) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty16 = (data: cameraObj.Profile) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty17 = (data: cameraObj.CameraOutputCapability) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty18 = (data: Array<cameraObj.MetadataObjectType>) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty19 = (data: cameraObj.MetadataOutput) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty20 = (data: Array<cameraObj.MetadataObject> | undefined) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty21 = (data: cameraObj.Session) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty22 = (data: int | null | undefined | Long): boolean =>
data === null || data === undefined;

let isEmpty23 = (data: Array<cameraObj.FrameRateRange>) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty24 = (data:cameraObj.PreviewOutput) => {
  if (data == null || data == undefined) {
    return true;
  }
  return false;
}

let isEmpty25 = (mainImage: image.Image | image.Picture): boolean => {
  if (mainImage == null || mainImage == undefined) {
    return true;
  }
  return false;
}

let isEmpty11 = (data: string | null | undefined): boolean =>
data === null || data === undefined;

let isEmpty12 = (data: cameraObj.CameraPosition | null | undefined): boolean =>
data === null || data === undefined;

let isEmpty13 = (data: cameraObj.CameraType | null | undefined): boolean =>
data === null || data === undefined;

let isEmpty14 = (data: cameraObj.ConnectionType | null | undefined): boolean =>
data === null || data === undefined;

// 创建input参数为cameraDevice的下标
let createInput = async (index: int): Promise<void> => {
  cameraInput = cameraManager!.createCameraInput(cameraDevicesArray[index]);
  if (!isEmpty04(cameraInput!)) {
    await cameraInput!.open();
  }
}

// 创建Output参数为cameraDevice的下标、相机模式
let createOutput = (index: int, mode: cameraObj.SceneMode) => {
  let height:int = 0;
  let width:int = 0;
  let i: int = 0;
  let k: int = 0;
  let equalFlag: boolean = false;
  let cameraOutputCap = cameraManager!.getSupportedOutputCapability(cameraDevicesArray[index], mode)
  if (mode == cameraObj.SceneMode.NORMAL_VIDEO) {
    for (i = 0; i < cameraOutputCap.previewProfiles.length; i++){
      height = cameraOutputCap.previewProfiles[i].size.height
      width = cameraOutputCap.previewProfiles[i].size.width
      for (k = 0; k < cameraOutputCap.videoProfiles.length; k++) {
        if (cameraOutputCap.videoProfiles[k].size.height ==height &&
          cameraOutputCap.videoProfiles[k].size.width === width) {
          equalFlag = true;
          break;
       }
      }
      if (equalFlag){
        break;
      }
    }
    if (equalFlag) {
      hilog.info(domain, tag, 'createOutput find valid video profile' + JSON.stringify(cameraOutputCap.videoProfiles[k]));
      previewOutput = cameraManager!.createPreviewOutput(cameraOutputCap.previewProfiles[i], surfaceId);
      videoProfilesArray = cameraOutputCap.videoProfiles;
      videoProfilesArray[0] = cameraOutputCap.videoProfiles[k];
    }
  } else {
    photoOutput = cameraManager!.createPhotoOutput(cameraOutputCap.photoProfiles[0]);
    hilog.info(domain, tag, 'Receiver is ok'  + JSON.stringify(photoOutput!))
  }
}

let createPhotoOutput = (index: int, mode: cameraObj.SceneMode) => {
  let equalFlag: boolean = false;
  let cameraOutputCap = cameraManager!.getSupportedFullOutputCapability(cameraDevicesArray[index], mode)
  if (mode == cameraObj.SceneMode.NORMAL_PHOTO) {
    let targetProfile = cameraOutputCap.photoProfiles[0];
    for (let i = 0; i < cameraOutputCap.photoProfiles.length; i++) {
      if (cameraOutputCap.photoProfiles[i].format === cameraObj.CameraFormat.CAMERA_FORMAT_YUV_420_SP) {
        targetProfile = cameraOutputCap.photoProfiles[i];
        break;
      }
    }
    photoOutput = cameraManager!.createPhotoOutput(targetProfile);
    hilog.info(domain, tag, 'Receiver is ok'  + JSON.stringify(photoOutput))
  }
}

// 创建Session对象参数为相机模式
let createPhotoSession = (mode: cameraObj.SceneMode) => {
  hilog.info(domain, tag, `createPhotoSession mode: ` + mode);
  if (mode == cameraObj.SceneMode.NORMAL_VIDEO) {
    cameraSession = cameraManager!.createSession<cameraObj.VideoSession>(mode) as cameraObj.VideoSession;
  } else if (mode == cameraObj.SceneMode.NORMAL_PHOTO) {
    cameraSession = cameraManager!.createSession<cameraObj.PhotoSession>(mode) as cameraObj.PhotoSession;
  } else {
    hilog.info(domain, tag, `createPhotoSession mode is not supported: ` + mode);
    expect().assertFail();
  }
  cameraSession!.beginConfig();
}

// 释放相机资源
let stopCameraSession = async () => {
  cameraSession!.beginConfig();
  if (!isEmpty04(cameraInput!)) {
    cameraSession!.removeInput(cameraInput!);
    await cameraInput!.close();
  }
  if (!isEmpty07(previewOutput!)) {
    cameraSession!.removeOutput(previewOutput!);
    await previewOutput!.release();
  }
  if (photoOutput != null || photoOutput != undefined) {
    cameraSession!.removeOutput(photoOutput!);
    await photoOutput!.release();
  }
  await cameraSession!.commitConfig();
}

// 添加相机流参数为cameraDevice的下标、相机模式
let addCommit = async (i: int, mode: cameraObj.SceneMode) => {
  await createInput(i);
  createOutput(i, mode);
  if (cameraInput!) {
    cameraSession!.addInput(cameraInput!);
  }
  if (mode == cameraObj.SceneMode.NORMAL_VIDEO) {
    if (previewOutput!) {
      cameraSession!.addOutput(previewOutput!);
    }
  } else {
    if (photoOutput!) {
      cameraSession!.addOutput(photoOutput!);
    }
  }
}

// 获取相机列表
let getCameraDevices = () => {
  let appContext: Context = Hypium.get("Context") as Context;
  cameraManager = cameraObj.getCameraManager(appContext);
  Utils.msSleep(1000);
  cameraDevicesArray = cameraManager!.getSupportedCameras();
  let sceneModes: Array<cameraObj.SceneMode> = cameraManager!.getSupportedSceneModes(cameraDevicesArray[0]);
  hilog.info(domain, tag, `  supportedSceneModes sceneModes.length: ` + sceneModes.length)
}


export default function cameraJSUnitOutput() {

  let getImageReceiverSurfaceId = async () => {
    hilog.info(domain, tag, 'Entering create Image receiver')
    receiver = image.createImageReceiver({ width: 640, height: 480 }, image.ImageFormat.JPEG, 4,)
    hilog.info(domain, tag, 'before receiver check')
    if (receiver !== undefined) {
      hilog.info(domain, tag, 'Receiver is ok')
      surfaceIds = await receiver!.getReceivingSurfaceId()
      hilog.info(domain, tag, 'Received id: ' + JSON.stringify(surfaceIds))
    } else {
      hilog.info(domain, tag, 'Receiver is not ok')
    }
  }

  let fdNumber: int;
  let fdPath: string = '';

  let getFd = async (pathName: string) => {
    let fileDir: string = Hypium.get('pathDir') as string;
    pathName = fileDir + '/' + pathName;
    let file = fs.openSync(pathName, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
    fdNumber = file.fd;
    fdPath = "fd://" + `${fdNumber}`;
    hilog.info(domain, tag, 'case getFd number is: ' + fdNumber);
  }

  let closeFd = async () => {
    hilog.info(domain, tag, 'case come in closeFd')
    if (fdNumber != null) {
      fs.closeSync(fdNumber);
    } else {
      hilog.info(domain, tag, '[fs.closeSync] case fdNumber is null');
    }
  }

  let getPreviewOutputSurface = () => {
    console.log(tag + 'Entering getPreviewOutputSurface')
    try {
      surfaceId = Hypium.get('SurfaceId') as string;
    } catch(err) {
      console.info(tag +
        "getPreviewOutputSurface FAILED err " + JSON.stringify(err));
    }
    if (surfaceId == '') {
      console.error(tag + ' getPreviewOutputSurface surfaceId failed, surfaceId is null')
      expect().assertFail();
    }
    console.info(tag + 'getPreviewOutputSurface surfaceId: ' + surfaceId)
  }

  let getVideoSurface = async () => {
    await getFd('CameraManager.mp4');
    await Utils.msSleep(2000);
    videoConfig.url = fdPath;
    AVRecorder = await media.createAVRecorder();
    let errs = await AVRecorder!.prepare(videoConfig);
    videoSurfaceId = await AVRecorder!.getInputSurface();
    hilog.info(domain, tag, `getSurfaceId start 4`);
  }

  let release = async () => {
    hilog.info(domain, tag, "start release");
    await AVRecorder!.release();
    await captureSession!.release();
    hilog.info(domain, tag, "release end")
  }

  let getSupportedOutputCapabilityInPromise = (cameraDevice: cameraObj.CameraDevice, mode: cameraObj.SceneMode): cameraObj.CameraOutputCapability => {
    if (isEmpty01(cameraManager!)) {
      hilog.info(domain, tag, "  Entering SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_PROMISE_0100 cameraManager == null || undefined")
      expect().assertFail();
    }
    let outputCapabilityPromise: cameraObj.CameraOutputCapability = cameraManager!.getSupportedOutputCapability(cameraDevice, mode);
    hilog.info(domain, tag, `  Entering testSupportedOutputCapabilityPromise: , ${outputCapabilityPromise}`);
    hilog.info(domain, tag, `  Entering testSupportedOutputCapabilityPromise MetadataObjectTypes.length is : , ${outputCapabilityPromise.supportedMetadataObjectTypes.length}`);
    
    expect(isEmpty09(outputCapabilityPromise)).assertFalse();

    return outputCapabilityPromise;
  }


  let startSession = async (i: int, mode: cameraObj.SceneMode) => {
    // 创建相机
    getCameraDevices()
    // 创建输出流
    createOutput(i, mode)
    // 配置录制参数, 获取 videoSurfaceId
    hilog.info(domain, tag, 'videoSurfaceId: ' + videoSurfaceId)
    // 创建VideoOutput对象
    videoOutput = cameraManager!.createVideoOutput(videoProfilesArray[0], videoSurfaceId!);
    //创建会话
    createPhotoSession(mode)
    // 配置会话
    createInput(i);
    if (cameraInput!) {
      cameraSession!.addInput(cameraInput!);
    }
    if (previewOutput!) {
      cameraSession!.addOutput(previewOutput!);
    }
    if (videoOutput!) {
      cameraSession!.addOutput(videoOutput!);
    }
    await cameraSession!.commitConfig();
    cameraSession!.start();
  }


  describe('cameraJSUnitOutput', () => {
    hilog.info(domain, tag, '----------cameraJSUnitOutput begin--------------')
    beforeAll(() => {
      await getVideoSurface();
      getPreviewOutputSurface();
      await getPhotoReceiverSurface();
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'beforeAll case');
    })

    beforeEach(() => {
      await Utils.msSleep(2000);
      hilog.info(domain, tag, 'beforeEach case');
    })

    afterEach(() => {
      hilog.info(domain, tag, 'afterEach case');
    })

    afterAll(() => {
      await closeFd();
      await release();
      hilog.info(domain, tag, 'afterAll case');
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_STATIC_0100
     * @tc.desc   Create CameraManager instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_GET_CAMERA_MANAGER_CALLBACK_STATIC_0100--------------");
      try {
        let appContext: Context = Hypium.get("Context") as Context;
        cameraManager = cameraObj.getCameraManager(appContext);
        await Utils.msSleep(1000);
      } catch (error) {
        expect(isEmpty08(error as BusinessError)).assertTrue();
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_STATIC_0100
     * @tc.desc   Get camera from cameramanager to get array of camera async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_CAMERAS_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------GET_CAMERAS--------------");
      cameraDevicesArray = cameraManager!.getSupportedCameras();
      if (isEmpty02(cameraDevicesArray)) {
        expect().assertFail();
        hilog.info(domain, tag, "Entering GET_CAMERAS FAILED cameraArray is null || undefined");
      } else {
        hilog.info(domain, tag, "Entering GET_CAMERAS data is not null || undefined");
        if (cameraDevicesArray != null && cameraDevicesArray.length > 0) {
          for (let i = 0; i < cameraDevicesArray.length; i++) {
            let cameraId = cameraDevicesArray[i].cameraId;
            expect(isEmpty11(cameraId)).assertFalse();
            hilog.info(domain, tag, "Entering GET_CAMERAS camera" + i + "Id: " + cameraId);
            let cameraPosition = cameraDevicesArray[i].cameraPosition;
            expect(isEmpty12(cameraPosition)).assertFalse();
            hilog.info(domain, tag, "Entering GET_CAMERAS camera" + i + "Position: " + cameraPosition);
            let cameraType = cameraDevicesArray[i].cameraType;
            expect(isEmpty13(cameraType)).assertFalse();
            hilog.info(domain, tag, "Entering GET_CAMERAS camera" + i + "Type: " + cameraType);
            let connectionType = cameraDevicesArray[i].connectionType
            expect(isEmpty14(connectionType)).assertFalse();
            hilog.info(domain, tag, "Entering GET_CAMERAS connection" + i + "Type: " + connectionType);
          }
          hilog.info(domain, tag, "Entering GET_CAMERAS PASSED");
        }
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0100
     * @tc.desc   Create previewOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0100--------------");
      cameraInput = cameraManager!.createCameraInput(cameraDevicesArray[0]);
      if (isEmpty04(cameraInput!)) {
        hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_CREATE_CAMERA_INPUT_PROMISE_STATIC_0100 FAILED");
      }
      cameraInput!.open((err:BusinessError | null) => {
        if (err) {
          expect(err.code != null).assertTrue();
        }
      })
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   Create previewOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_STATIC_0100--------------");
    
      hilog.info(domain, tag, "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_STATIC_0100")
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      let previewProfilesArray = cameraOutputCap!.previewProfiles;
      if (isEmpty06(previewProfilesArray)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 previewProfilesArray == null || undefined")
        expect(isEmpty06(previewProfilesArray)).assertFalse();
      }
      previewOutput = cameraManager!.createPreviewOutput(previewProfilesArray![0], surfaceId);
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Create photoOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_STATIC_0100--------------");
    
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      let photoProfilesArray = cameraOutputCap!.photoProfiles;
      if (isEmpty06(photoProfilesArray)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_STATIC_0100 previewProfilesArray == null || undefined")
        expect().assertFalse();
      }
      photoOutput = cameraManager!.createPhotoOutput(photoProfilesArray![0]);
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CREATE_PHOTO_OUTPUT_PROMISE_STATIC_0100 data is empty");
        expect().assertFalse();
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   Create videoOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      Utils.msSleep(1000);
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_STATIC_0100--------------");
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_STATIC_0100 camera:" +
      cameraDevicesArray[0].cameraId + cameraDevicesArray[0].cameraPosition);
      expect(isEmpty17(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
      expect(isEmpty16(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_STATIC_0100 start createVideoOutput")
        videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
      } else {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_CREATE_VIDEO_OUTPUT_CALLBACK_STATIC_0100 createVideoOutput parse err `)
      }
      videoOutput!.release();
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   Create metadataOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100--------------");
    
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      hilog.info(domain, tag, "  SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100 camera:" +
      cameraDevicesArray[0].cameraId);
      expect(isEmpty17(cameraOutputCap)).assertFalse();
      mMetadataObjectTypeArray = cameraOutputCap!.supportedMetadataObjectTypes;
      hilog.info(domain, tag, "  mMetadataObjectTypeArray length: " + mMetadataObjectTypeArray!.length);
      if (isEmpty18(mMetadataObjectTypeArray) || mMetadataObjectTypeArray!.length < 1) {
        hilog.info(domain, tag, "  SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100 end with mMetadataObjectTypeArray is null");
      } else {
        hilog.info(domain, tag,
          "  Entering SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100 start createMetadataOutput")
        metadataOutput = cameraManager!.createMetadataOutput(mMetadataObjectTypeArray);
        hilog.info(domain, tag, "  SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100 1111");
        if (metadataOutput == null || metadataOutput == undefined) {
          hilog.info(domain, tag, "  SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100 metadataOutput is null");
        } else {
          hilog.info(domain, tag, "  SUB_MULTIMEDIA_CAMERA_CREATE_METADATA_OUTPUT_CALLBACK_STATIC_0100 create metadataOutput success");
        }
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_STATIC_0100
     * @tc.desc   Create CaptureSession instance api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_STATIC_0100--------------");
      try {
        hilog.info(domain, tag, "Entering  SUB_MULTIMEDIA_CAMERA_CREATE_CAPTURE_SESSION_CALLBACK_STATIC_0100")
        captureSession = cameraManager!.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
      } catch (error) {
        error = error as BusinessError;
        expect(isEmpty08(error)).assertTrue();
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_STATIC_0100
     * @tc.desc   captureSession beginConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_STATIC_0100--------------");
      if (isEmpty03(captureSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_BEGIN_CONFIG_CALLBACK_STATIC_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession!.beginConfig();
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_STATIC_0100
     * @tc.desc   captureSession addInput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_STATIC_0100--------------");
      if (isEmpty03(captureSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_INPUT_CALLBACK_STATIC_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        captureSession!.addInput(cameraInput!)
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   captureSession add previewOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_STATIC_0100--------------");
      if (isEmpty03(captureSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty24(previewOutput!)) {
          hilog.info(domain, tag,
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 previewOutput == null || undefined")
          expect().assertFail();
        }
        captureSession!.addOutput(previewOutput!)
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   captureSession add photoOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_STATIC_0100--------------");
      if (isEmpty03(captureSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_STATIC_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (isEmpty15(photoOutput!)) {
          hilog.info(domain, tag,
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_PHOTO_OUTPUT_CALLBACK_STATIC_0100 photoOutput == null || undefined")
          expect().assertFail();
        }
        hilog.info(domain, tag, "captureSession start add photoOutput")
        captureSession!.addOutput(photoOutput!)
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   captureSession remove photoOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_STATIC_0100--------------");
      Utils.msSleep(1000);
      if (isEmpty03(captureSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_STATIC_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          captureSession!.addOutput(videoOutput!)
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_VIDEO_OUTPUT_CALLBACK_STATIC_0100 createVideoOutput parse err `)
        }
      }
      videoOutput!.release();
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   captureSession add metadataOutput
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_STATIC_0100--------------");
      if (isEmpty03(captureSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_ADD_METADATA_OUTPUT_CALLBACK_STATIC_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        if (metadataOutput != null && metadataOutput != undefined) {
          captureSession!.addOutput(metadataOutput as cameraObj.MetadataOutput)
        }
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_STATIC_0100
     * @tc.desc   captureSession commitConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(cameraSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_STATIC_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        cameraSession!.commitConfig((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_STATIC_0100 FAILED: " +
              err + err.code);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_COMMIT_CONFIG_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   Start metadataOutput type async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100--------------");
      if (metadataOutput == null || metadataOutput == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput!.onMetadataObjectsAvailable((err: BusinessError | null, data: Array<cameraObj.MetadataObject> | undefined) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag,
              "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 is not error");
            expect(isEmpty20(data)).assertFalse();
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 success");
            mMetadataObjectArray = data;
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_ON_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 ends here");
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   metadata output callback off metadataObjectsAvailable api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100--------------");
      if (metadataOutput == null || metadataOutput == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput!.offMetadataObjectsAvailable((err: BusinessError | null, data:Array<cameraObj.MetadataObject> | undefined) => {
          if (!err || err!.code == 0) {
            hilog.info(domain, tag,
              "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 is not error");
            expect(isEmpty20(data)).assertFalse();
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 success");
            mMetadataObjectArray = data;
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_OFF_AVAILABLE_METADATA_OUTPUT_CALLBACK_STATIC_0100 ends here");
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.desc   metadata output callback on error api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100--------------");
      if (metadataOutput == null || metadataOutput == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 metadata is not support")
      } else {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 to operate");
        metadataOutput!.onError((err: BusinessError) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 success");
          } else {
            expect().assertFail();
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 FAILED: " +
            err.message);
          }
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100
     * @tc.desc   metadata output callback off error api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100--------------");
      if (metadataOutput == null || metadataOutput == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 metadata is not support")
      } else {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 to operate");
        metadataOutput!.offError((err: BusinessError) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 success");
          } else {
            expect().assertFail();
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_METADATA_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 FAILED: " +
            err.message);
          }
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_STATIC_0100
     * @tc.desc   captureSession start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(cameraSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_STATIC_0100 captureSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        await cameraSession!.commitConfig();
        cameraSession!.start((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_START_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_STATIC_0100
     * @tc.desc   cameraSession stop
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(cameraSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_STATIC_0100 cameraSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        await cameraSession!.commitConfig();
        cameraSession!.stop((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_STATIC_0100 FAILED: " +
            err.code+cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR);
            expect(err!.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_STOP_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_STATIC_0100
     * @tc.desc   cameraSession release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(cameraSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_STATIC_0100 cameraSession == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        await cameraSession!.commitConfig();
        cameraSession!.release((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_RELEASE_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   Start metadataOutput type async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (metadataOutput == null || metadataOutput == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_STATIC_0100 metadataOutput == null || undefined")
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        cameraSession!.addOutput(metadataOutput as cameraObj.MetadataOutput);
        await cameraSession!.commitConfig();
        metadataOutput!.start((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_CALLBACK_STATIC_0100 ends here");
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_STATIC_0100
     * @tc.desc   Start metadataOutput type async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_STATIC_0100--------------");
      if (mMetadataObjectArray == null || mMetadataObjectArray == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_STATIC_0100 mMetadataObjectArray == null || undefined")
        expect(mMetadataObjectArray == null || mMetadataObjectArray == undefined).assertTrue();
      } else {
        let type = mMetadataObjectArray![0].type;
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TYPE_PROMISE_STATIC_0100 success, type : " + type);
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_STATIC_0100
     * @tc.desc   Start metadataOutput timestamp async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_STATIC_0100--------------");
      if (mMetadataObjectArray == null || mMetadataObjectArray == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_STATIC_0100 mMetadataObjectArray == null || undefined")
        expect(mMetadataObjectArray == null || mMetadataObjectArray == undefined).assertTrue();
      } else {
        let timeStamp = mMetadataObjectArray![0].timestamp;
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_TIMESTAMP_PROMISE_STATIC_0100 success, timeStamp : " +
          timeStamp);
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_STATIC_0100
     * @tc.desc   Start metadataOutput bounding box async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_STATIC_0100--------------");
      if (mMetadataObjectArray == null || mMetadataObjectArray == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_STATIC_0100 mMetadataObjectArray == null || undefined")
        expect(mMetadataObjectArray == null || mMetadataObjectArray == undefined).assertTrue();
      } else {
        let boundingBox = mMetadataObjectArray![0].boundingBox;
        let w = boundingBox.width;
        let h = boundingBox.height;
        let tx = boundingBox.topLeftX;
        let ty = boundingBox.topLeftY;
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_STATIC_0100 success, boundingBox : " + w + "x" +
          h);
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_GET_METADATA_BOUNDING_BOX_PROMISE_STATIC_0100 success, boundingBox : " + tx + "x" +
          ty);
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   Stop metadataOutput type async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_STATIC_0100--------------");
      if (metadataOutput == null || metadataOutput == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_STATIC_0100 metadataOutput == null || undefined")
      } else {
        metadataOutput!.stop((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   Create previewOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(cameraSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        await cameraSession!.commitConfig();
        cameraSession!.start((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_START_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0100
     * @tc.desc   Create release session async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(cameraSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        await cameraSession!.commitConfig();
        cameraSession!.release((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0200
     * @tc.desc   Create release session errorcode async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0200--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(cameraSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0200 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        await cameraSession!.commitConfig();
        cameraSession!.release((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0200 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0200 FAILED: " +
            err.message);
            expect(err!.code == cameraObj.CameraErrorCode.SERVICE_FATAL_ERROR).assertTrue();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_RELEASE_SESSION_CALLBACK_STATIC_0200 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_STATIC_0100
     * @tc.desc   Create previewOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(cameraSession!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        await cameraSession!.commitConfig();
        cameraSession!.stop((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_STOP_PREVIEW_OUTPUT_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100
     * @tc.desc   preview output callback on frameStart api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100--------------");
      if (isEmpty07(previewOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 to operate");
        let count = 0;
        previewOutput!.onFrameStart((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 success");
            count++;
          } else {
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          await Utils.msSleep(1000);
          done();
        })
        await Utils.msSleep(1000);
        done();
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100
     * @tc.desc   preview output callback on frameEnd api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100--------------");
      if (isEmpty07(previewOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100 to operate");
        let count = 0;
        previewOutput!.onFrameEnd((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            count++
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100 success");
          } else {
            expect().assertFail();
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100 FAILED: " +
            err.message);
          }
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.desc   preview output callback on frameEnd api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100--------------");
      if (isEmpty07(previewOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 to operate");
        previewOutput!.onError((err: BusinessError) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 success");
          } else {
            expect().assertFail();
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 FAILED: " +
            err.message);
          }
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0200
     * @tc.desc   check photoOutput is mirror supported with promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0200--------------");
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0200 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        let isMirrorSupportedFlag = photoOutput!.isMirrorSupported();
        hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_IS_MIRROR_SUPPORTED_PROMISE_STATIC_0200 isMirrorSupportedFlag = ' +
          isMirrorSupportedFlag);
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_STATIC_0100
     * @tc.desc   photoOutput capture with promise mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
      await cameraSession!.commitConfig();
      await Utils.msSleep(500);
      await cameraSession!.start();
      hilog.info(domain, tag,
        `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_STATIC_0100 +${photoOutput}`)
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_STATIC_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput!.capture().then(() => {
          hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_STATIC_0100 success');
        }).catch((err: Error) => {
          hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_PROMISE_STATIC_0100 failed :' + err);
          expect().assertFail();
        });
      }
      await Utils.msSleep(6000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_STATIC_0100
     * @tc.desc   captureSession commitConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_STATIC_0100--------------");
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
      await cameraSession!.commitConfig();
      await Utils.msSleep(500);
      await cameraSession!.start();
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_STATIC_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        photoOutput!.capture((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_DEFAULT_CALLBACK_STATIC_0100 ends here");
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(6000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100
     * @tc.desc   captureSession commitConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag,
        " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100--------------");
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100 photoOutput == null || undefined")
        expect().assertFail();
      } else {
        hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100 captureSetting.quality = ' +
        captureSetting.quality);
        hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100 captureSetting.rotation = ' +
        captureSetting.rotation);
        hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100 captureSetting.location.latitude = ' +
        captureSetting.location!.latitude);
        hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100 captureSetting.location.longitude = ' +
        captureSetting.location!.longitude);
        hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100 captureSetting.location.altitude = ' +
        captureSetting.location!.altitude);
        hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100 captureSetting.mirror = ' +
        captureSetting.mirror);
    
        try {
          await photoOutput!.capture(captureSetting);
        } catch (err) {
          hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_PROMISE_STATIC_0100 FAILED");
          hilog.info(domain, tag, "ERRORCODE: " + err.code);
        }
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100
     * @tc.desc   captureSession commitConfig
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag,
          " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100--------------");
        createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
        await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
        await cameraSession!.commitConfig();
        await Utils.msSleep(500);
        await cameraSession!.start();
        if (isEmpty15(photoOutput!)) {
          hilog.info(domain, tag,
            "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100 photoOutput == null || undefined")
          expect().assertFail();
        } else {
          photoOutput!.capture(captureSetting, (err: BusinessError | null) => {
            if (!err || err.code == 0) {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100 success");
            } else {
              expect().assertFail();
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100 FAILED: " +
              err.message);
            }
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100 ends here");
            await Utils.msSleep(1000);
            done();
          })
        }
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CAPTURE_SETTING_CALLBACK_STATIC_0100 ends here");
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_STATIC_0100
     * @tc.desc   photo output callback on captureStart
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_STATIC_0100--------------");
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_STATIC_0100 to operate");
        let count = 0;
        photoOutput!.onCaptureStartWithInfo((err: BusinessError |null, data: cameraObj.CaptureStartInfo |undefined|undefined) => {
          if (!err || err.code == 0) {
            expect((!isEmpty22(data!.captureId)) && (!isEmpty22(data!.time))).assertTrue();
            hilog.info(domain, tag,
              "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_STATIC_0100 success");
          } else {
            expect().assertFail();
            hilog.info(domain, tag,
              "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_START_WITH_INFO_STATIC_0100 FAILED: " +
            err.message);
          }
        })
        photoOutput!.capture();
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_STATIC_0100
     * @tc.desc   photo output callback off captureReady
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_READY_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
    
      // 打开监听
      photoOutput!.onCaptureReady((err: BusinessError | null) => {
        hilog.info(domain, tag, `photo output start listen on captureReady failed: ${err!.code}`);
      })
    
      // 关闭监听
      await Utils.msSleep(1000);
      photoOutput!.offCaptureReady((err: BusinessError | null) => {
        hilog.info(domain, tag, `photo output stop listen on captureReady failed: ${err!.code}`);
        expect(true).assertFalse()
        await Utils.msSleep(1000);
        done();
      })
      hilog.info(domain, tag, `photo output stop listen on captureReady success`);
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100
     * @tc.desc   photo output callback on frameShutter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100--------------");
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100 to operate");
        let count = 0;
        photoOutput!.onFrameShutter((err: BusinessError |null, data:cameraObj.FrameShutterInfo | undefined) => {
          if (!err || err.code == 0) {
            count++;
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100 success");
            hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100, captureId = " +
            data!.captureId);
            hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100, timestamp = " +
            data!.timestamp);
          } else {
            expect().assertFail();
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_STATIC_0100 FAILED: " +
            err.message);
          }
          await Utils.msSleep(1000);
          done();
        })
        await Utils.msSleep(1000);
        done();
        photoOutput!.capture();
    
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100
     * @tc.desc   photo output callback on captureEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100--------------");
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100 to operate");
        let count = 0;
        photoOutput!.onCaptureEnd((err: BusinessError |null, data:cameraObj.CaptureEndInfo | undefined) => {
          if (!err || err.code == 0) {
            count++;
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100 success");
            hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100, captureId = " +
            data!.captureId);
            hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100, frameCount = " +
            data!.frameCount);
          } else {
            expect().assertFail();
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_END_STATIC_0100 FAILED: " +
            err.message);
          }
        })
        await Utils.msSleep(1000);
        done();
        photoOutput!.capture();
    
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.desc   photo output callback on error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100--------------");
      if (isEmpty15(photoOutput!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 previewOutput == null || undefined")
        expect().assertFail();
      } else {
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 to operate");
        photoOutput!.onError((err: BusinessError) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 success");
          } else {
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ERROR_STATIC_0100 FAILED: " +
            err.message);
            expect().assertFail();
          }
          await Utils.msSleep(1000);
          done();
        })
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_STATIC_0100
     * @tc.desc   videoOutput start promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_STATIC_0100--------------");
        Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_STATIC_0100 start")
          videoOutput!.start();
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_STATIC_0100 end")
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_STATIC_0100 createVideoOutput parse err`)
        }
        videoOutput!.release();
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_PROMISE_STATIC_0100 error`)
      }
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_STATIC_0100
     * @tc.desc   videoOutput stop promise api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_STATIC_0100--------------");
        Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_STATIC_0100 start")
          videoOutput!.stop();
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_STATIC_0100 end")
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_STATIC_0100 createVideoOutput parse err`)
        }
        videoOutput!.release();
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_PROMISE_STATIC_0100 error`);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_STATIC_0100
     * @tc.desc   photo output callback on estimatedCaptureDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
    
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_ESTIMATED_CAPTURE_DURATION_STATIC_0100 to operate");
    
      // 打开监听
      photoOutput!.onEstimatedCaptureDuration((err: BusinessError |null, data:double | undefined) => {
        hilog.info(domain, tag, `photo output start listen on estimatedCaptureDuration failed: ${err!.code}`);
        expect(true).assertFalse()
        await Utils.msSleep(1000);
        done();
      })
      hilog.info(domain, tag, `photo output start listen on estimatedCaptureDuration success`);
    
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Start metadataOutput sync api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_STATIC_0100--------------");
      if (metadataOutput == null || metadataOutput == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_STATIC_0100 metadataOutput == null || undefined")
        expect(metadataOutput == null || metadataOutput == undefined).assertTrue();
      } else {
        metadataOutput!.start().then(() => {
        }).catch((err: Error) => {
          hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_STATIC_0100 failed :' + err);
        });
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_START_METADATA_OUTPUT_PROMISE_STATIC_0100 ends here");
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_STATIC_0100
     * @tc.desc   photo output callback off estimatedCaptureDuration
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
    
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ESTIMATED_CAPTURE_DURATION_STATIC_0100 to operate");
    
      // 打开监听
      photoOutput!.onEstimatedCaptureDuration((err : BusinessError | null, data:double | undefined) => {
        hilog.info(domain, tag, `photo output start listen on estimatedCaptureDuration failed: ${err!.code}`);
      })
    
      // 关闭监听
      await Utils.msSleep(1000);
      photoOutput!.offEstimatedCaptureDuration((err: BusinessError | null, data: double | undefined) => {
        hilog.info(domain, tag, `photo output stop listen on estimatedCaptureDuration failed: ${err!.code}`);
        expect(true).assertFalse()
        await Utils.msSleep(1000);
        done();
      })
      hilog.info(domain, tag, `photo output stop listen on estimatedCaptureDuration success`);
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_STATIC_0100
     * @tc.desc   Stop metadataOutput aync api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_STATIC_0100--------------");
      if (metadataOutput == null || metadataOutput == undefined) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_STATIC_0100 metadataOutput == null || undefined")
        expect(metadataOutput == null || metadataOutput == undefined).assertTrue();
      } else {
        metadataOutput!.stop().then(() => {
          hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_STATIC_0100 success');
        }).catch((err: Error) => {
          hilog.info(domain, tag, 'SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_STATIC_0100 failed :' + err);
        });
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_STOP_METADATA_OUTPUT_PROMISE_STATIC_0100 ends here");
      }
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100
     * @tc.desc   videoOutput start async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100--------------");
        Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          videoOutput!.start((err: BusinessError | null) => {
            if (!err || err.code == 0) {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100 success");
            } else {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100 FAILED: " +
              err.message);
            }
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100 ends here");
          })
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100 createVideoOutput parse err`)
        }
        videoOutput!.release();
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_START_CALLBACK_STATIC_0100 error`);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100
     * @tc.desc   videoOutput stop async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100--------------");
        Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          videoOutput!.stop((err: BusinessError | null) => {
            if (!err || err.code == 0) {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100 success");
            } else {
              expect().assertFail();
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100 FAILED: " +
              err.message);
            }
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100 ends here");
          })
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100 createVideoOutput parse err`)
        }
        videoOutput!.release();
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_STOP_CALLBACK_STATIC_0100 error`)
      }
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0100
     * @tc.desc   photo output callback on photoAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0100 to operate");
    
      // 打开监听
      try {
        photoOutput!.onPhotoAvailable((error: BusinessError |null, photo: cameraObj.Photo | undefined) => {
          console.info(`photo output on photoAvailable callback is called`);
          if (error != undefined && error!.code !== 0) {
            console.info('photo output start listen on photoAvailable failed: ' + error!.code);
            expect().assertFail();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0100 FAILED! ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(`photo output on photoAvailable success`);
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0200
     * @tc.desc   photo output callback on capture photoAvailable for CapturePhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0200--------------");
      // 创建相机
      getCameraDevices()

      //创建输出流
      createPhotoOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0200 to operate");

      // 打开监听
      try {
        photoOutput!.onCapturePhotoAvailable((CapturePhoto: cameraObj.CapturePhoto) => {
          console.info(`photo output on photoAvailable callback is called for CapturePhoto`);
          if (!CapturePhoto || !CapturePhoto.main) {
            console.error(tag + ' received invalid CapturePhoto or missing main image');
            expect().assertFail();
            return;
          }
          let mainImage: image.Image | image.Picture = CapturePhoto.main;
          console.info(tag + ' succeed to listen photoAvailable on for CapturePhoto.');
          expect(isEmpty25(mainImage)).assertFalse();
          CapturePhoto.release();
        });
      } catch (err) {
        hilog.error(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_AVAILABLE_STATIC_0200 FAILED! ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(`photo output onPhotoAvailable for CapturePhoto success`);
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100
     * @tc.desc   video output callback on frameStart api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100--------------");
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 to operate");
        Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          videoOutput!.onFrameStart((err: BusinessError | null) => {
            if (!err || err.code == 0) {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 success");
            } else {
              expect().assertFail();
              hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 createVideoOutput parse err `)
        }
        videoOutput!.release();
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_START_STATIC_0100 error`);
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100
     * @tc.desc   video output callback on frameEnd api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100--------------");
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100 to operate");
      Utils.msSleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty17(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
      expect(isEmpty16(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
        videoOutput!.onFrameEnd((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100 success");
          } else {
            expect().assertFail();
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100 FAILED: " +
            err.message);
          }
        })
      } else {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_END_STATIC_0100 createVideoOutput parse err `)
      }
      videoOutput!.release();
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0100
     * @tc.desc   photo output callback off photoAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0100 to operate");
    
      // 打开监听
      photoOutput!.onPhotoAvailable((error: BusinessError |null, photo: cameraObj.Photo | undefined) => {
        console.info(`photo output on photoAvailable callback is called`);
      })
    
      // 关闭监听
      await Utils.msSleep(1000);
      try{
        photoOutput!.offPhotoAvailable((error: BusinessError | null, photo: cameraObj.Photo | undefined) => {
          if (error != undefined && error!.code !== 0) {
            console.info(`photo output stop listen off photoAvailable failed: ${error.code}`);
            expect().assertFail();
          }
        })
      } catch (err) {
        hilog.error(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0100 FAILED! ERRORCODE: " + err.code);
      }
      console.info(`photo output stop listen on photoAvailable success`);
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0200
     * @tc.desc   photo output callback off capature photoAvailable for CapturePhoto
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0200--------------");
      // 创建相机
      getCameraDevices()

      //创建输出流
      createPhotoOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0200 to operate");

      // 打开监听
      photoOutput!.onCapturePhotoAvailable((CapturePhoto: cameraObj.CapturePhoto) => {
        console.info(`photo output on photoAvailable callback is called for CapturePhoto`);
      })

      // 关闭监听
      await Utils.msSleep(1000);
      try{
        photoOutput!.offCapturePhotoAvailable((CapturePhoto: cameraObj.CapturePhoto) => {
          console.info(`photo output on photoAvailable callback is called for CapturePhoto`);
          if (!CapturePhoto || !CapturePhoto.main) {
            console.error(tag + ' received invalid CapturePhoto or missing main image');
            expect().assertFail();
            return;
          }
          let mainImage: image.Image | image.Picture = CapturePhoto.main;
          console.info(tag + ' succeed to listen photoAvailable off for CapturePhoto.');
          expect(isEmpty25(mainImage)).assertFalse();
          CapturePhoto.release();
        })
      } catch (err) {
        hilog.error(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_AVAILABLE_STATIC_0200 FAILED! ERRORCODE: " + err.code);
      }
      console.info(`photo output stop listen on photoAvailable for CapturePhoto success`);
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_STATIC_0100
     * @tc.desc   photo output callback on photoAssetAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_STATIC_0100 to operate");
    
      // 打开监听
      try {
        photoOutput!.onPhotoAssetAvailable((error: BusinessError | null, photoAsset: photoAccessHelper.PhotoAsset | undefined) => {
          console.info('photo output start listen on photoAssetAvailable callback is called');
          if (error != undefined && error!.code !== 0) {
            console.info(`photo output start listen on photoAssetAvailable failed: ${error!.code}`);
            expect().assertFail();
          }
        });
      } catch (err) {
        hilog.error(domain, tag, "ENTERING SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_PHOTO_ASSET_AVAILABLE_STATIC_0100 FAILED! ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(`photo output start listen on photoAssetAvailable success`);
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_STATIC_0100
     * @tc.desc   photo output callback off photoAssetAvailable
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_STATIC_0100 to operate");
    
      // 打开监听
      photoOutput!.onPhotoAssetAvailable((error: BusinessError | null, photoAsset: photoAccessHelper.PhotoAsset | undefined) => {
        console.info(`photo output on photoAssetAvailable callback is called`);
      });
    
      // 关闭监听
      await Utils.msSleep(1000);
      try {
        photoOutput!.offPhotoAssetAvailable((error: BusinessError | null, photoAsset: photoAccessHelper.PhotoAsset | undefined) => {
          if (error != undefined && error!.code !== 0) {
            console.info(`photo output stop listen on photoAssetAvailable failed: ${error!.code}`);
            expect().assertFail();
          }
        })
      } catch (err) {
        hilog.error(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_PHOTO_ASSET_AVAILABLE_STATIC_0100 FAILED! ERRORCODE: " + err.code);
        expect().assertFail();
      }
      console.info(`photo output stop listen on photoAssetAvailable success`);
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_STATIC_0100
     * @tc.desc   photo output callback on capture start with info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
    
      // 先开启监听
      photoOutput!.onCaptureStartWithInfo((err: BusinessError | null, data: cameraObj.CaptureStartInfo | undefined) => {
        hilog.info(domain, tag, `photo output error code: ${err!.code}`);
      })
    
    
      hilog.info(domain, tag,
        "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_STATIC_0100 to operate");
      let count = 0;
      photoOutput!.offCaptureStartWithInfo((err: BusinessError | null, data: cameraObj.CaptureStartInfo | undefined) => {
        if (!err || err.code == 0) {
          expect((!isEmpty22(data!.captureId)) && (!isEmpty22(data!.time))).assertTrue();
          hilog.info(domain, tag,
            "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_STATIC_0100 success");
        } else {
          expect().assertFail();
          hilog.info(domain, tag,
            "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_STATIC_0100 FAILED: " +
          err.message);
        }
      })
      expect(1 == 1).assertTrue();
      hilog.info(domain, tag,
        "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_START_WITH_INFO_STATIC_0100 success");
      photoOutput!.capture();
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100
     * @tc.desc   photo output callback off frameShutter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
    
      // 先开启监听
      photoOutput!.onFrameShutter((err: BusinessError | null, data: cameraObj.FrameShutterInfo | undefined) => {
        hilog.info(domain, tag, `photo output error code: ${err!.code}`);
      })
    
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100 to operate");
      let count = 0;
      photoOutput!.offFrameShutter((err: BusinessError | null, data:cameraObj.FrameShutterInfo | undefined) => {
        if (!err || err.code == 0) {
          count++;
          hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100 success");
          hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100, captureId = " +
          data!.captureId);
          hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100, timestamp = " +
          data!.timestamp);
        } else {
          expect(1 == 1).assertFail();
          hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100 FAILED: " +
          err.message);
        }
        await Utils.msSleep(1000);
        done();
      })
      expect(1 == 1).assertTrue();
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_STATIC_0100 success");
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_STATIC_0100
     * @tc.desc   photo output callback on frameShutterEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_FRAME_SHUTTER_END_STATIC_0100 to operate");
    
      // 打开监听
      photoOutput!.onFrameShutterEnd((err: BusinessError | null, data: cameraObj.FrameShutterEndInfo | undefined) => {
        hilog.info(domain, tag, `photo output start listen on frameShutterEnd failed: ${err!.code}`);
        expect(true).assertFalse()
        await Utils.msSleep(1000);
        done();
      })
      hilog.info(domain, tag, `photo output start listen on frameShutterEnd success`);
    
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_STATIC_0100
     * @tc.desc   photo output callback off frameShutterEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_FRAME_SHUTTER_END_STATIC_0100 to operate");
    
      // 打开监听
      photoOutput!.onFrameShutterEnd((err: BusinessError | null, data: cameraObj.FrameShutterEndInfo | undefined) => {
        hilog.info(domain, tag, `photo output start listen on frameShutterEnd failed: ${err!.code}`);
      })
    
      // 关闭监听
      await Utils.msSleep(1000);
      photoOutput!.offFrameShutterEnd((err: BusinessError | null, data: cameraObj.FrameShutterEndInfo | undefined) => {
        hilog.info(domain, tag, `photo output stop listen on frameShutterEnd failed: ${err!.code}`);
        expect(true).assertFalse()
        await Utils.msSleep(1000);
        done();
      })
      hilog.info(domain, tag, `photo output stop listen on frameShutterEnd success`);
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100
     * @tc.desc   photo output callback off captureEnd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100 to operate");
    
      // 先打开监听
      photoOutput!.onCaptureEnd((err: BusinessError | null, data: cameraObj.CaptureEndInfo | undefined) => {
        hilog.info(domain, tag, `photo output error code: ${err!.code}`);
      })
      await Utils.msSleep(1000)
    
      let count = 0;
      photoOutput!.offCaptureEnd((err: BusinessError | null, data: cameraObj.CaptureEndInfo | undefined) => {
        if (!err || err.code == 0) {
          count++;
          hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100, captureId = " +
          data!.captureId);
          hilog.info(domain, tag, "SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100, frameCount = " +
          data!.frameCount);
        } else {
          expect(1 == 1).assertFail();
          hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100 FAILED: " +
          err.message);
        }
      })
      expect(1 == 1).assertTrue();
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100 success");
      await Utils.msSleep(1000);
      done();
    
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_STATIC_0100
     * @tc.desc   photo output callback on captureReady
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_ON_CAPTURE_READY_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_CAPTURE_END_STATIC_0100 to operate");
    
      // 打开监听
      photoOutput!.onCaptureReady((err: BusinessError | null) => {
        hilog.info(domain, tag, `photo output start listen on captureReady failed: ${err!.code}`);
        expect(true).assertFalse()
        await Utils.msSleep(1000);
        done();
      })
      hilog.info(domain, tag, `photo output start listen on captureReady success`);
    
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100
     * @tc.desc   photo output callback off error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
    
      // 先开启监听
      photoOutput!.onError((err: BusinessError) => {
        hilog.info(domain, tag, `photo output error code: ${err.code}`);
      })
    
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 to operate");
      await Utils.msSleep(1000);
    
      // 关闭监听
      photoOutput!.offError((err: BusinessError) => {
        hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 FAILED: " +
        err.message);
        expect(1 == 1).assertFail();
      })
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 success");
      expect(1 == 1).assertTrue();
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100
     * @tc.desc   photo output getActiveProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
    
      // 获取激活的配置
      let activeProfile = photoOutput!.getActiveProfile()
      hilog.info(domain, tag, `activeProfile: ${JSON.stringify(activeProfile)}`)
    
      // 断言
      if (activeProfile) {
        expect(1 == 1).assertTrue();
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 success");
      } else {
        expect(1 == 1).assertFalse();
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_CALLBACK_OFF_ERROR_STATIC_0100 failed");
      }
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_STATIC_0200
     * @tc.desc   photo output enableMovingPhoto on errorCode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
    
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_ENABLE_MOVING_PHOTO_STATIC_0200--------------");
      // 创建相机
      getCameraDevices()
    
      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)
    
      // 开启动态图片功能
      try {
        photoOutput!.enableMovingPhoto(true)
        hilog.info(domain, tag, `photoOutput enableMovingPhoto success`)
      } catch (err) {
        hilog.info(domain, tag, `photoOutput enableMovingPhoto failed + ${JSON.stringify(err)}`)
        expect(true).assertFalse()
      }
    
      await Utils.msSleep(1000);
      done();
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100
     * @tc.desc   video output callback off frameStart api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100--------------");
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100 to operate");
        Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          videoOutput!.offFrameStart((err: BusinessError | null) => {
            if (!err || err.code == 0) {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100 success");
            } else {
              expect().assertFail();
              hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100 createVideoOutput parse err `)
        }
        videoOutput!.release();
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_START_STATIC_0100 error`);
      }
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_STATIC_0100
     * @tc.desc   video output callback off frameEnd api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_STATIC_0100--------------");
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_STATIC_0100 to operate");
      Utils.msSleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty17(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
      expect(isEmpty16(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
        videoOutput!.offFrameEnd((err: BusinessError | null) => {
          if (!err || err.code == 0) {
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_STATIC_0100 success");
          } else {
            expect().assertFail();
            hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_STATIC_0100 FAILED: " +
            err.message);
          }
        })
      } else {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_END_STATIC_0100 createVideoOutput parse err `)
      }
      videoOutput!.release();
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100
     * @tc.desc   video output get supported frameRates api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100--------------");
      hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100 to operate");
      Utils.msSleep(1000);
      let cameraOutputCap =
        getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      expect(isEmpty17(cameraOutputCap)).assertFalse();
      let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
      expect(isEmpty16(videoProfilesArray)).assertFalse();
      if (videoProfilesArray && videoSurfaceId) {
        videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
        let supportedFrameRatesArray = videoOutput!.getSupportedFrameRates()
        expect(isEmpty23(supportedFrameRatesArray)).assertFalse();
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100 success");
      } else {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0100 createVideoOutput parse err `)
      }
      videoOutput!.release();
      await Utils.msSleep(1000);
      done();
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100
     * @tc.desc   video output callback on error api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100--------------");
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100 to operate");
        Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          videoOutput!.onError((err: BusinessError) => {
            if (!err || err.code == 0) {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100 success");
            } else {
              expect().assertFail();
              hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100 createVideoOutput parse err `)
        }
        videoOutput!.release();
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_ON_FRAME_ERROR_STATIC_0100 error`);
        done();
      }
    })
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0200
     * @tc.desc   video output get supported frame rates
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------BEGIN SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_SUPPORTED_FRAME_RATES_STATIC_0200--------------");
    
      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)
    
      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput!.getSupportedFrameRates()
      hilog.info(domain, tag, `supportedFrameRates length: ` + supportedFrameRates.length)
      expect(isEmpty23(supportedFrameRates)).assertFalse()
      done()
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_STATIC_0100
     * @tc.desc   video output set frame rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_SET_FRAME_RATE_STATIC_0100--------------");
      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)
    
      // 获取支持的帧率范围
      let supportedFrameRates = videoOutput!.getSupportedFrameRates()
      hilog.info(domain, tag, `supportedFrameRates length: ` + supportedFrameRates.length)
      if (supportedFrameRates.length == 0) {
        hilog.info(domain, tag, `  SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100 supportedFrameRates is empty`)
        done();
      }
      let isFindResult = false;
      let frameRateRangeSetValue: cameraObj.FrameRateRange;
      // 遍历支持的帧率范围
      for (let i: int = 0; i < supportedFrameRates.length; i++) {
        let item: cameraObj.FrameRateRange = supportedFrameRates[i];
        hilog.info(domain, tag, `  SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100 supportedFrameRates: min = ${item.min}, max = ${item.max}`)
        if (Math.abs(item.max - item.min) > 1) {
          frameRateRangeSetValue = item;
          isFindResult = true;
          break;
        }
      }
      if (isFindResult == false) {
        hilog.info(domain, tag, `  SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100 not find suitable frameRateRange`)
        done();
      }
      // 设置帧率范围
      try {
        videoOutput!.setFrameRate((supportedFrameRates[0].min + 1), supportedFrameRates[0].max);
        hilog.info(domain, tag, `videoOutput set FrameRate success`)
      } catch(err) {
        hilog.info(domain, tag, `videoOutput set FrameRate failed`)
        expect(true).assertFalse();
      }
      done()
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100
     * @tc.desc   video output get active frame rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100--------------");
      // 创建一个Video会话
      await startSession(0, cameraObj.SceneMode.NORMAL_VIDEO)
    
      // 获取支持的帧率范围
      let supportedFrameRates: Array<cameraObj.FrameRateRange> = videoOutput!.getSupportedFrameRates()
      hilog.info(domain, tag, `supportedFrameRates length: ` + supportedFrameRates.length)
      if (supportedFrameRates.length == 0) {
        hilog.info(domain, tag, `  SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100 supportedFrameRates is empty`)
        done();
      }
      let isFindResult = false;
      let frameRateRangeSetValue: cameraObj.FrameRateRange | undefined;
      // 遍历支持的帧率范围
      for (let i: int = 0; i < supportedFrameRates.length; i++) {
        let item: cameraObj.FrameRateRange = supportedFrameRates[i];
        hilog.info(domain, tag, `  SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100 supportedFrameRates: min = ${item.min}, max = ${item.max}`)
        if (Math.abs(item.max - item.min) > 1) {
          frameRateRangeSetValue = item;
          isFindResult = true;
          break;
        }
      }
      if (isFindResult == false) {
        hilog.info(domain, tag, `  SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100 not find suitable frameRateRange`)
        done();
      }
      // 设置帧率范围
      try {
        hilog.info(domain, tag, `  SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_GET_ACTIVE_FRAME_RATE_STATIC_0100 set FrameRate: min = ${frameRateRangeSetValue!.min + 1}, max = ${frameRateRangeSetValue!.max}`)
        videoOutput!.setFrameRate((supportedFrameRates[0].min + 1), supportedFrameRates[0].max);
        hilog.info(domain, tag, `videoOutput set FrameRate success`)
      } catch (err) {
        hilog.info(domain, tag, `videoOutput set FrameRate failed + + ${JSON.stringify(err)}`)
      }
      // 获取激活的帧率范围
      let activeFrameRate = videoOutput!.getActiveFrameRate();
      hilog.info(domain, tag, `videoOutput get FrameRate success:  + ${JSON.stringify(activeFrameRate)}`)
      expect(activeFrameRate.min == (supportedFrameRates[0].min + 1)).assertTrue()
      done()
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100
     * @tc.desc   video output callback off error api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, "--------------SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100--------------");
        hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100 to operate");
        Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          videoOutput!.offError((err: BusinessError) => {
            if (!err || err.code == 0) {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100 success");
            } else {
              expect().assertFail();
              hilog.info(domain, tag, "Error in SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100 FAILED: " +
              err.message);
            }
          })
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100 createVideoOutput parse err `)
        }
        videoOutput!.release();
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_VIDEO_OUTPUT_CALLBACK_OFF_FRAME_ERROR_STATIC_0100 error`);
        done();
      }
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100
     * @tc.desc   Create previewOutput instance async api
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      try {
        hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100--------------");
        await Utils.msSleep(1000);
        let cameraOutputCap =
          getSupportedOutputCapabilityInPromise(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
        expect(isEmpty17(cameraOutputCap)).assertFalse();
        let videoProfilesArray = cameraOutputCap!.videoProfiles[0];
        expect(isEmpty16(videoProfilesArray)).assertFalse();
        if (videoProfilesArray && videoSurfaceId) {
          videoOutput = cameraManager!.createVideoOutput(videoProfilesArray, videoSurfaceId!);
          photoOutput!.release((err: BusinessError | null) => {
            if (!err || err.code == 0) {
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100 success");
            } else {
              expect().assertFail();
              hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100 FAILED: " +
              err.message);
            }
            hilog.info(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100 ends here");
            await Utils.msSleep(1000);
            done();
          })
        } else {
          hilog.info(domain, tag,
            `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100 createVideoOutput parse err `)
        }
        await Utils.msSleep(1000);
        done();
      } catch (err) {
        hilog.info(domain, tag,
          `Entering SUB_MULTIMEDIA_CAMERA_PHOTO_OUTPUT_RELEASE_CALLBACK_STATIC_0100 error`);
      }
    })
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_STATIC_0100
     * @tc.desc   capture session callback on error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_STATIC_01000--------------");
      if (isEmpty01(cameraManager!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_STATIC_0100 cameraManager == null || undefined");
        expect().assertFail();
      } else {
        try {
          captureSession = cameraManager!.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
          captureSession!.onError((error: BusinessError) => {
            hilog.error(domain, tag, `Capture session error code: ${error.code}`);
          });
          captureSession!.offError();
          done();
        } catch (err) {
          let error = err as BusinessError
          hilog.info(domain, tag,
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_STATIC_0100 FAILED!");
          hilog.info(domain, tag, 'ERRORCODE: ' + error.code)
          expect().assertFail();
          done();
        }
      }
      hilog.info(domain, tag,
        "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_ERROR_STATIC_0100 PASSED");
      done();
    });
    
    
    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_STATIC_0100
     * @tc.desc   capture session callback on focusStateChange
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, " --------------SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_STATIC_0100--------------");
      if (isEmpty01(cameraManager!)) {
        hilog.info(domain, tag,
          "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_STATIC_0100 == null || undefined");
        expect().assertFail();
      } else {
        try {
          captureSession = cameraManager!.createSession<cameraObj.VideoSession>(cameraObj.SceneMode.NORMAL_VIDEO);
          captureSession!.onFocusStateChange( (error: BusinessError | null, focusState: cameraObj.FocusState | undefined) => {
            if (error !== undefined && error!.code !== 0) {
              hilog.error(domain, tag, `Callback Error, errorCode: ${error!.code}`);
              return;
            }
            hilog.info(domain, tag, `Focus state: ${focusState}`);
          });
          captureSession!.offFocusStateChange();
          done();
        } catch (err) {
          let error = err as BusinessError
          hilog.info(domain, tag,
            "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_STATIC_0100 FAILED!");
          hilog.info(domain, tag, 'ERRORCODE: ' + error.code)
          expect().assertFail();
          done();
        }
      }
      hilog.info(domain, tag,
        "Entering SUB_MULTIMEDIA_CAMERA_CAPTURE_SESSION_CALLBACK_ON_FOCUS_STATE_CHANGE_STATIC_0100 PASSED");
      done();
    });
    
     /**
      * @tc.name   SUB_MULTIMEDIA_CAMERA_PHOTO_RELEASE_STATIC_0100
      * @tc.number SUB_MULTIMEDIA_CAMERA_PHOTO_RELEASE_STATIC_0100
      * @tc.desc   photo release
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL1
      */
     it('SUB_MULTIMEDIA_CAMERA_PHOTO_RELEASE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PHOTO_RELEASE_STATIC_0100--------------");
    
      getCameraDevices()
    
      createPhotoSession(cameraObj.SceneMode.NORMAL_PHOTO);
      await addCommit(0, cameraObj.SceneMode.NORMAL_PHOTO);
      await cameraSession!.commitConfig();
      await cameraSession!.start();
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_RELEASE_STATIC_0100 to operate");
    
      let result: boolean = false;
      let photoTest: cameraObj.Photo | undefined;
      try{
        photoOutput!.onPhotoAvailable((error: BusinessError | null, photo: cameraObj.Photo | undefined) => {
          console.info('photo output on photoAssetAvailable callback is called');
          if (error !== undefined && error!.code !== 0) {
            console.info(`photo output start listen on photoAvailable failed: ${error!.code}`);
            expect().assertFail();
          }
          if (photo !== null && photo !== undefined) {
            console.info(`photo output on photoAvailable photo is not null`);
            result = true;
            photoTest = photo;
          }
        });
        if (result && photoTest != null && photoTest != undefined) {
          console.info('SUB_MULTIMEDIA_CAMERA_PHOTO_RELEASE_STATIC_0100 start to release photo');
          await photoTest!.release();
        }
      } catch (err) {
        hilog.error(domain, tag, "Entering SUB_MULTIMEDIA_CAMERA_PHOTO_RELEASE_STATIC_0100 error: " + err.code);
        expect().assertFail();
      }
      await cameraSession!.release();
      done();
     });

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0100
     * @tc.desc   preview output set frame rate
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0100--------------");
      let appContext: Context = Hypium.get("Context") as Context;
      cameraManager = cameraObj.getCameraManager(appContext);
      let camerasArray = cameraManager!.getSupportedCameras();
      if (isEmpty01(cameraManager!)) {
          console.info(tag + "mCameraManager == null || undefined");
          expect().assertFail();
      }
      let captureSession = cameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(captureSession!)) {
          console.info(tag + "captureSession == null || undefined");
          expect().assertFail();
      }
      console.info("SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0100 camera:" + camerasArray[0].cameraId);
      let cameraOutputCap = getSupportedOutputCapabilityInPromise(camerasArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty09(cameraOutputCap)) {
          console.info(tag + "Entering cameraOutputCap == null || undefined");
          expect().assertFail();
      }
      let cameraInput = cameraManager!.createCameraInput(camerasArray[0]);
      if (isEmpty04(cameraInput!)) {
          console.info(tag + "Entering cameraInput == null || undefined");
          expect().assertFail();
      }
      let previewProfiles: cameraObj.Profile = cameraOutputCap?.previewProfiles[0] as cameraObj.Profile;
      expect(isEmpty16(previewProfiles)).assertFalse();
      previewOutput = cameraManager!.createPreviewOutput(previewProfiles, surfaceId)
      await cameraInput!.open();
      captureSession!.beginConfig();
      if (!isEmpty04(cameraInput!)) {
          console.info(tag + "Start to addInput");
          captureSession!.addInput(cameraInput!);
      }
      if (!isEmpty07(previewOutput!)) {
          console.info(tag + "Start to addOutput previewOutput");
          captureSession!.addOutput(previewOutput!);
      }
      await captureSession!.commitConfig();
      try {
        // 获取支持的帧率范围
        let supportedFrameRates = previewOutput!.getSupportedFrameRates()
        console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
        await Utils.msSleep(1000);

        previewOutput!.setFrameRate(supportedFrameRates[0].min + 1, supportedFrameRates[0].max - 1);
        console.info(`videoOutput set FrameRate success`)
      } catch (err) {
        console.info(`videoOutput set FrameRate failed: ` + err.code)
        expect().assertFail();
      }
      await captureSession!.release();
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0100 PASS");
      await Utils.msSleep(1000);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200
     * @tc.desc   preview output set frame rate with errorCode 7400101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200--------------");
      let appContext: Context = Hypium.get("Context") as Context;
      cameraManager = cameraObj.getCameraManager(appContext);
      let camerasArray = cameraManager!.getSupportedCameras();
      if (isEmpty01(cameraManager!)) {
          console.info(tag + "mCameraManager == null || undefined");
          expect().assertFail();
      }
      let captureSession = cameraManager!.createSession<cameraObj.PhotoSession>(cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty21(captureSession!)) {
          console.info(tag + "captureSession == null || undefined");
          expect().assertFail();
      }
      console.info("SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200 camera:" + camerasArray[0].cameraId);
      let cameraOutputCap = getSupportedOutputCapabilityInPromise(camerasArray[0], cameraObj.SceneMode.NORMAL_PHOTO);
      if (isEmpty09(cameraOutputCap)) {
          console.info(tag + "Entering cameraOutputCap == null || undefined");
          expect().assertFail();
      }
      let cameraInput = cameraManager!.createCameraInput(camerasArray[0]);
      if (isEmpty04(cameraInput!)) {
          console.info(tag + "Entering cameraInput == null || undefined");
          expect().assertFail();
      }
      let previewProfiles: cameraObj.Profile = cameraOutputCap?.previewProfiles[0] as cameraObj.Profile;
      expect(isEmpty16(previewProfiles)).assertFalse();
      previewOutput = cameraManager!.createPreviewOutput(previewProfiles, surfaceId)
      await cameraInput!.open();
      captureSession!.beginConfig();
      if (!isEmpty04(cameraInput!)) {
          console.info(tag + "Start to addInput");
          captureSession!.addInput(cameraInput!);
      }
      if (!isEmpty07(previewOutput!)) {
          console.info(tag + "Start to addOutput previewOutput");
          captureSession!.addOutput(previewOutput!);
      }
      await captureSession!.commitConfig();
      try {
        // 获取支持的帧率范围
        let supportedFrameRates = previewOutput!.getSupportedFrameRates()
        console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
        await Utils.msSleep(1000);

        previewOutput!.setFrameRate(-1, -1);
        console.info(`previewOutput set FrameRate success`)
        expect(true).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.info(`previewOutput set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.INVALID_ARGUMENT).assertTrue();
      }
      await captureSession!.release();
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0200 PASS");
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300
     * @tc.desc   preview output set frame rate with errorCode 7400110
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300',  TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300--------------");
      // 创建相机
      getCameraDevices()
      // 创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_VIDEO)
      // 配置录制参数, 获取 videoSurfaceId
      await getVideoSurface();
      console.info('videoSurfaceId: ' + videoSurfaceId)
      // 创建2个VideoOutput对象
      let cameraOutputCap = cameraManager!.getSupportedOutputCapability(cameraDevicesArray[0], cameraObj.SceneMode.NORMAL_VIDEO);
      let videoProfileValid = cameraOutputCap.videoProfiles.find((videoProfile: cameraObj.Profile) => {
        return Math.abs((cameraOutputCap.previewProfiles[0].size.width / cameraOutputCap.previewProfiles[0].size.height) - (videoProfile.size.width / videoProfile.size.height)) < Number.EPSILON;
      });
      videoOutput = cameraManager!.createVideoOutput(videoProfileValid!, videoSurfaceId!);
      //创建会话
      createPhotoSession(cameraObj.SceneMode.NORMAL_VIDEO)
      // 配置会话
      await createInput(0);
      if (cameraInput != null && cameraInput != undefined) {
        cameraSession!.addInput(cameraInput!);
      }
      if (previewOutput != null && previewOutput != undefined) {
        cameraSession!.addOutput(previewOutput!);
      }
      if (videoOutput != null && videoOutput != undefined) {
        cameraSession!.addOutput(videoOutput!);
      }
      try {
        await cameraSession!.commitConfig();
      } catch (err) {
        console.info("Skipping As The Device is Not Supported");
        done()
      }
      cameraSession!.start();

      // 获取支持的帧率范围
      let supportedFrameRates = previewOutput!.getSupportedFrameRates()
      console.info(`supportedFrameRates:  + ${JSON.stringify(supportedFrameRates)}`)
      await Utils.msSleep(1000);

      try {
        previewOutput!.setFrameRate(supportedFrameRates[0].min + 1, supportedFrameRates[0].max - 1);
        console.info(`previewOutput set FrameRate success`)
        expect(true).assertFalse();
      } catch (err) {
        err = err as BusinessError;
        console.info(`previewOutput set FrameRate failed: ` + err.code)
        expect(err.code == cameraObj.CameraErrorCode.UNRESOLVED_CONFLICTS_WITH_CURRENT_CONFIGURATIONS).assertTrue();
      }
      await cameraSession!.release();
      console.info(tag + "Entering SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_SET_FRAME_RATE_STATIC_0300 PASS");
      await Utils.msSleep(1000);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100
     * @tc.desc   preview output getActiveProfile
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info("--------------SUB_MULTIMEDIA_CAMERA_PREVIEW_OUTPUT_GET_ACTIVE_PROFILE_STATIC_0100--------------");
      // 创建相机
      getCameraDevices()

      //创建输出流
      createOutput(0, cameraObj.SceneMode.NORMAL_PHOTO)

      // 获取激活的配置
      try {
        let activeProfile = previewOutput!.getActiveProfile()
        console.info(`get activeProfile success: ${JSON.stringify(activeProfile)}`)
      } catch (err) {
        console.info(`get activeProfile failed: ${JSON.stringify(err.code)}`)
        expect().assertFail()
      }
      await Utils.msSleep(1000);
      done();
    })
  })
}
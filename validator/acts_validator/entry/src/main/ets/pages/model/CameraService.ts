/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
// @ts-nocheck

import camera from '@ohos.multimedia.camera';
import deviceInfo from '@ohos.deviceInfo';
import fileio from '@ohos.fileio';
import image from '@ohos.multimedia.image';
import media from '@ohos.multimedia.media';
import Logger from '../model/Logger';
import prompt from '@ohos.prompt';
import fs from '@ohos.file.fs';
import screen from '@ohos.screen';
import DateTimeUtil from '../model/DateTimeUtil';

const CameraSize = {
  WIDTH: 1280,
  HEIGHT: 720
}

class CameraService {
  private tag: string = 'qlw CameraService';
  private static instance: CameraService = new CameraService();
  private cameraManager: camera.CameraManager = undefined;
  cameras: Array<camera.CameraDevice> = undefined;
  private cameraInput: camera.CameraInput = undefined;
  private previewOutput: camera.PreviewOutput = undefined;
  private photoOutput: camera.PhotoOutput = undefined;
  private cameraOutputCapability: camera.CameraOutputCapability = undefined;
  captureSession: camera.CaptureSession = undefined;
  private mReceiver: image.ImageReceiver = undefined;
  private fd: number = -1;
  private videoRecorder: media.VideoRecorder = undefined;
  private videoOutput: camera.VideoOutput = undefined;
  private handleTakePicture: (photoUri: string) => void = undefined;
  private videoConfig: any = {
    audioSourceType: 1,
    videoSourceType: 0,
    profile: {
      audioBitrate: 48000,
      audioChannels: 2,
      audioCodec: 'audio/mp4a-latm',
      audioSampleRate: 48000,
      durationTime: 1000,
      fileFormat: 'mp4',
      videoBitrate: 280000,
      videoCodec: 'video/avc',
      videoFrameWidth: 640,
      videoFrameHeight: 480,
      videoFrameRate: 15,

    },
    rotation: 270,
    url: '',
    orientationHint: 0,
    location: { latitude: 30, longitude: 130 },
    maxSize: 10000,
    maxDuration: 10000
  };
  private videoProfileObj: camera.VideoProfile = {
    format: 1,
    size: {
      "width": 640,
      "height": 480
    },
    frameRateRange: {
      "min": 5,
      "max": 5
    }
  };
  private photoProfileObj: camera.Profile = {
    format: 1,
    size: {
      "width": 640,
      "height": 480
    }
  };
  private videoOutputStopBol: boolean = true;
  resolution: any = null;
  photoResolution: any = null;
  videoResolution: any = null;
  screensObj: any = null;

  async getScreensObj() {
    let screens = await screen.getAllScreens();
    this.screensObj = screens[0].supportedModeInfo;
    Logger.info(this.tag, ` this.screensObj success` + JSON.stringify(this.screensObj));
  }

  constructor() {
    try {
      this.mReceiver = image.createImageReceiver(CameraSize.WIDTH, CameraSize.HEIGHT, image.ImageFormat.JPEG, 8);
      Logger.info(this.tag, 'createImageReceiver');
      this.mReceiver.on('imageArrival', () => {
        Logger.info(this.tag, 'imageArrival');
        this.mReceiver.readNextImage((err, image) => {
          Logger.info(this.tag, 'readNextImage');
          if (err || image === undefined) {
            Logger.error(this.tag, 'failed to get valid image');
            return
          }
          image.getComponent(4, (errMsg, img) => {
            Logger.info(this.tag, 'getComponent');
            if (errMsg || img === undefined) {
              Logger.info(this.tag, 'failed to get valid buffer');
              return
            }
            let buffer;
            if (img.byteBuffer) {
              buffer = img.byteBuffer;
            } else {
              Logger.error(this.tag, 'img.byteBuffer is undefined');
            }
            this.savePicture(buffer, image);
          })
        })
      })
    } catch (err) {
      Logger.info(this.tag, `image Receiver err ${err.message}`);
    }
  }

  async savePicture(buffer: ArrayBuffer, img: image.Image) {
    try {
      Logger.info(this.tag, 'savePicture');
      let dateTimeUtil = new DateTimeUtil();
      let filesDir = globalThis.abilityContext.filesDir;
      let name = `${dateTimeUtil.getDate()}_${dateTimeUtil.getTime()}`
      let path = filesDir + '/IMG_' + name + '.jpg';
      Logger.info(this.tag, `getFileFd path : ${path}`);    
      let Fd = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(Fd.fd, buffer);
      if (Fd.fd) {
        fs.closeSync(Fd.fd);
        Logger.info(this.tag, `release Fd.fd success`);
      }
      await img.release();
      Logger.info(this.tag, 'save image done');
      if (this.handleTakePicture) {
        this.handleTakePicture(path)
      }
    } catch (err) {
      Logger.info(this.tag, `save picture err ${err.message}`);
    }
  }

  async initCamera(surfaceId: number, cameraDeviceIndex: number, obj?, photoIndex?, previewObj?) {
    await this.getCameraManagerFn();
    await this.getSupportedCamerasFn();
    this.cameraOutputCapability = this.cameraManager.getSupportedOutputCapability(this.cameras[cameraDeviceIndex]);
    let videoPro = this.cameraOutputCapability.videoProfiles[0].format;
    try {
      if (videoPro === camera.CameraFormat.CAMERA_FORMAT_RGBA_8888) {
        this.videoConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_ES;
      } else {
        this.videoConfig.videoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV;
      }
      Logger.info(this.tag, `cameraDeviceIndex success: ${cameraDeviceIndex}`);
      await this.getScreensObj();
      await this.releaseCamera();
      await this.getSupportedOutputCapabilityFn(cameraDeviceIndex);
      if (previewObj) {
        previewObj.format = this.cameraOutputCapability.previewProfiles[0].format;
        Logger.info(this.tag, `previewObj format: ${previewObj.format}`);
      }
      await this.createPreviewOutputFn(previewObj ? previewObj : this.cameraOutputCapability.previewProfiles[0], surfaceId);
      //            await this.createPhotoOutputFn(this.photoProfileObj)
      await this.createPhotoOutputFn(obj ? obj : this.cameraOutputCapability.photoProfiles[photoIndex?photoIndex:0]);
      await this.createCameraInputFn(this.cameras[cameraDeviceIndex]);
      await this.cameraInputOpenFn();
      await this.sessionFlowFn();

    } catch (err) {
      Logger.info(this.tag, 'initCamera err: ' + JSON.stringify(err.message));
    }
  }

  // 曝光模式
  isExposureModeSupportedFn(ind) {
    try {
      let status = this.captureSession.isExposureModeSupported(ind);
      Logger.info(this.tag, `isExposureModeSupported success: ${status}`);
      prompt.showToast({
        message: status ? '支持此模式' : '不支持此模式',
        duration: 2000,
        bottom: '60%'
      })
      // 设置曝光模式
      this.captureSession.setExposureMode(ind);
      Logger.info(this.tag, `setExposureMode success`);
      // 获取当前曝光模式
      let exposureMode = this.captureSession.getExposureMode();
      Logger.info(this.tag, `getExposureMode success: ${exposureMode}`);
    } catch (err) {
      Logger.info(this.tag, `isExposureModeSupportedFn fail: ${err} , message: ${err.message}, code: ${err.code}`);
    }
  }

  // 曝光区域
  isMeteringPoint(Point1) {
    try {
      // 获取当前曝光模式
      let exposureMode = this.captureSession.getExposureMode();
      Logger.info(this.tag, `getExposureMode success: ${exposureMode}`);
      // 设置曝光区域中心点
      this.captureSession.setMeteringPoint(Point1);
      Logger.info(this.tag, `setMeteringPoint success`);
      // 查询曝光区域中心点
      let exposurePoint = this.captureSession.getMeteringPoint();
      Logger.info(this.tag, `getMeteringPoint success: ${exposurePoint}`);
    } catch (err) {
      Logger.info(this.tag, `isMeteringPoint fail err: ${err}, message: ${err.message}, code: ${err.code}`);
    }
  }

  // 曝光补偿
  isExposureBiasRange(ind) {
    try {
      // 查询曝光补偿范围
      let biasRangeArray = this.captureSession.getExposureBiasRange();
      Logger.info(this.tag, `getExposureBiasRange success: ${biasRangeArray}`);
      // 设置曝光补偿
      this.captureSession.setExposureBias(ind);
      Logger.info(this.tag, `setExposureBias success: ${ind}`);
      // 查询当前曝光值
      let exposureValue = this.captureSession.getExposureValue();
      Logger.info(this.tag, `getExposureValue success: ${exposureValue}`);
    } catch (err) {
      Logger.info(this.tag, `isExposureBiasRange fail err: ${err}, message: ${err.message}, code: ${err.code}`);
    }
  }

  // 对焦模式
  isFocusMode(ind) {
    try {
      // 检测对焦模式是否支持
      let status = this.captureSession.isFocusModeSupported(ind);
      Logger.info(this.tag, `isFocusModeSupported success: ${status}`);
      prompt.showToast({
        message: status ? '支持此模式' : '不支持此模式',
        duration: 2000,
        bottom: '60%'
      })
      // 设置对焦模式
      this.captureSession.setFocusMode(ind);
      Logger.info(this.tag, `setFocusMode success`);
      // 获取当前对焦模式
      let afMode = this.captureSession.getFocusMode();
      Logger.info(this.tag, `getFocusMode success: ${afMode}`);
    } catch (err) {
      Logger.info(this.tag, `isFocusMode fail err: ${err}, message: ${err.message}, code: ${err.code}`);
    }
  }

  // 对焦点
  isFocusPoint(Point) {
    try {
      // 设置对焦点
      this.captureSession.setFocusPoint(Point);
      Logger.info(this.tag, `setFocusPoint success`);
      // 获取当前对焦点
      let point = this.captureSession.getFocusPoint();
      Logger.info(this.tag, `getFocusPoint success: ${point}`);
    } catch (err) {
      Logger.info(this.tag, `isFocusPoint fail err: ${err}, message: ${err.message}, code: ${err.code}`);
    }
  }

  // 闪光灯
  hasFlashFn(ind) {
    try {
      // 检测是否有闪光灯
      let status = this.captureSession.hasFlash();
      Logger.info(this.tag, `hasFlash success: ${status}`);
      // 检测闪光灯模式是否支持
      let status1 = this.captureSession.isFlashModeSupported(ind);
      Logger.info(this.tag, `isFlashModeSupported success: ${status1}`);
      prompt.showToast({
        message: status1 ? '支持此模式' : '不支持此模式',
        duration: 2000,
        bottom: '60%'
      })
      // 设置闪光灯模式
      this.captureSession.setFlashMode(ind);
      Logger.info(this.tag, `setFlashMode success`);
      // 获取当前设备的闪光灯模式
      let flashMode = this.captureSession.getFlashMode();
      Logger.info(this.tag, `getFlashMode success: ${flashMode}`);
    } catch (err) {
      Logger.info(this.tag, `hasFlashFn fail err: ${err}, message: ${err.message}, code: ${err.code}`);
    }
  }

  // 变焦
  setZoomRatioFn(num) {
    try {
      // 获取当前支持的变焦范围
      let zoomRatioRange = this.captureSession.getZoomRatioRange();
      Logger.info(this.tag, `getZoomRatioRange success: ${zoomRatioRange}`);
      // 设置变焦比
      Logger.info(this.tag, `setZoomRatioFn num: ${num}`);
      this.captureSession.setZoomRatio(num);
      Logger.info(this.tag, `setZoomRatio success`);
      // 获取当前对焦比
      let zoomRatio = this.captureSession.getZoomRatio();
      Logger.info(this.tag, `getZoomRatio success: ${zoomRatio}`);
    } catch (err) {
      Logger.info(this.tag, `setZoomRatioFn fail err: ${err}, message: ${err.message}, code: ${err.code}`);
    }
  }

  // 防抖
  isVideoStabilizationModeSupportedFn(ind) {
    try {
      // 查询是否支持指定的视频防抖模式
      let isSupported = this.captureSession.isVideoStabilizationModeSupported(ind);
      Logger.info(this.tag, `isVideoStabilizationModeSupported success: ${isSupported}`);
      prompt.showToast({
        message: isSupported ? '支持此模式' : '不支持此模式',
        duration: 2000,
        bottom: '60%'
      })
      // 设置视频防抖
      this.captureSession.setVideoStabilizationMode(ind);
      Logger.info(this.tag, `setVideoStabilizationMode success`);
      // 查询当前正在使用的防抖模式
      let vsMode = this.captureSession.getActiveVideoStabilizationMode();
      Logger.info(this.tag, `getActiveVideoStabilizationMode success: ${vsMode}`);
    } catch (err) {
      Logger.info(this.tag, `isVideoStabilizationModeSupportedFn fail err: ${err}, message: ${err.message}, code: ${err.code}`);
    }
  }

  setTakePictureCallback(callback) {
    this.handleTakePicture = callback;
  }

  // 照片方向判断
  onChangeRotation() {
    if (globalThis.photoOrientation == 0) {
      return 0
    }
    if (globalThis.photoOrientation == 1) {
      return 90
    }
    if (globalThis.photoOrientation == 2) {
      return 180
    }
    if (globalThis.photoOrientation == 3) {
      return 270
    }
  }

  // 照片地理位置逻辑，后续靠定位实现，当前传入固定值
  onChangeLocation() {
    if (globalThis.settingDataObj.locationBol) {
      return {
        latitude: 12,
        longitude: 77,
        altitude: 1000
      }
    }
    return {
      latitude: 0,
      longitude: 0,
      altitude: 0
    }
  }

  // 拍照
  async takePicture(imageRotation?) {
    try {
      Logger.info(this.tag, 'takePicture start')
      let photoSettings = {
        rotation: imageRotation ? Number(imageRotation) : 0,
        quality: 1,
        location: {
          latitude: 0,
          longitude: 0,
          altitude: 0
        },
        mirror: false
      }
      Logger.info(this.tag, `photoOutput capture photoSettings: ` + JSON.stringify(photoSettings))
      await this.photoOutput.capture(photoSettings)
      Logger.info(this.tag, 'takePicture end')
    } catch (err) {
      Logger.info(this.tag, `takePicture fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 获取Fd
  async getFileFd() {
    let filesDir = globalThis.abilityContext.filesDir
    Logger.info(this.tag, `beginConfig 3`)
    let path = filesDir + '/' + 'test.mp4'
    Logger.info(this.tag, `beginConfig 4`)
    let file = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC)
    Logger.info(this.tag, `getFileFd : ${file.fd}`)
    return file.fd
  }

  // 开始录制
  async startVideo() {
    try {
      Logger.info(this.tag, `startVideo begin`)
      await this.captureSession.stop()
      await this.captureSession.beginConfig()
      // await this.captureSession.removeOutput(this.photoOutput);
      this.fd = await this.getFileFd()
      this.videoRecorder = await media.createVideoRecorder()
      this.videoConfig.url = `fd://${this.fd}`
      this.videoConfig.profile.videoFrameWidth = this.cameraOutputCapability.videoProfiles[0].size.width
      this.videoConfig.profile.videoFrameHeight = this.cameraOutputCapability.videoProfiles[0].size.height
      await this.videoRecorder.prepare(this.videoConfig)
      let videoId = await this.videoRecorder.getInputSurface()
      // Logger.info(this.tag, `videoProfileObj: ` + JSON.stringify(this.videoProfileObj))
      Logger.info(this.tag, `videoConfig.profile: ` + JSON.stringify(this.videoConfig.profile))
      Logger.info(this.tag, `videoProfileObj1: ` + JSON.stringify(this.cameraOutputCapability.videoProfiles[0]))
      this.videoOutput = await this.cameraManager.createVideoOutput(this.cameraOutputCapability.videoProfiles[0], videoId)
      Logger.info(this.tag, `createVideoOutput success: ${this.videoOutput}`)
      await this.captureSession.addOutput(this.videoOutput)
      Logger.info(this.tag, `startVideo begin1`)
      await this.captureSession.commitConfig()
      Logger.info(this.tag, `startVideo begin2`)
      await this.captureSession.start()
      Logger.info(this.tag, `startVideo begin3`)
      await this.videoOutput.start()
      Logger.info(this.tag, `startVideo begin4`)
      await this.videoRecorder.start().then(() => {
        setTimeout(async () => {
          await this.stopVideo()
          Logger.info(this.tag, `setTimeout stopVideo end`)
        }, 3000)
      })
      Logger.info(this.tag, `videoOutput end`)
    } catch (err) {
      Logger.info(this.tag, `startVideo fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 停止录制
  async stopVideo() {
    try {
      if (this.videoRecorder) {
        await this.videoRecorder.stop()
        await this.videoRecorder.release()
      }
      if (this.videoOutput) {
        if (this.videoOutputStopBol) {
          await this.videoOutput.stop()
        }
        await this.videoOutput.release()
      }
      Logger.info(this.tag, `stopVideo success`)
    } catch (err) {
      Logger.info(this.tag, `stopVideo fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 查询相机设备在模式下支持的输出能力
  async getSupportedOutputCapabilityFn(cameraDeviceIndex) {
    Logger.info(this.tag, `cameraOutputCapability cameraId: ${this.cameras[cameraDeviceIndex].cameraId}`)
    // @ts-ignore
    this.cameraOutputCapability = this.cameraManager.getSupportedOutputCapability(this.cameras[cameraDeviceIndex])
    let previewSize = []
    let photoSize = []
    let videoSize = []
    this.cameraOutputCapability.previewProfiles.forEach((item, index) => {
      Logger.info(this.tag, `cameraOutputCapability previewProfiles index: ${index}, item:` + JSON.stringify(item))
      previewSize.push({
        value: `${item.size.width}x${item.size.height}`
      })
    })
    this.cameraOutputCapability.photoProfiles.forEach((item, index) => {
      Logger.info(this.tag, `cameraOutputCapability photoProfiles index: ${index}, item:` + JSON.stringify(item))
      photoSize.push({
        value: `${item.size.width}x${item.size.height}`
      })
    })
    this.cameraOutputCapability.videoProfiles.forEach((item, index) => {
      Logger.info(this.tag, `cameraOutputCapability videoProfiles index: ${index}, item:` + JSON.stringify(item))
      videoSize.push({
        value: `${item.size.width}x${item.size.height}`
      })
    })
    Logger.info(this.tag, `cameraOutputCapability previewProfiles:` + JSON.stringify(this.cameraOutputCapability.previewProfiles))
    Logger.info(this.tag, `cameraOutputCapability photoProfiles:` + JSON.stringify(this.cameraOutputCapability.photoProfiles))
    Logger.info(this.tag, `cameraOutputCapability videoProfiles:` + JSON.stringify(this.cameraOutputCapability.videoProfiles))
    Logger.info(this.tag, `cameraOutputCapability previewProfiles previewSize:` + JSON.stringify(previewSize))
    this.resolution = previewSize
    this.photoResolution = photoSize
    this.videoResolution = videoSize
    return previewSize
  }

  // 释放会话及其相关参数
  async releaseCamera() {
    try {
      if (this.cameraInput) {
        await this.cameraInput.release()
      }
      if (this.previewOutput) {
        await this.previewOutput.release()
      }
      if (this.photoOutput) {
        await this.photoOutput.release()
      }
      if (this.videoOutput) {
        await this.videoOutput.release()
      }
      if (this.captureSession) {
        await this.captureSession.release()
      }
      Logger.info(this.tag, `releaseCamera success`)
    } catch (err) {
      Logger.info(this.tag, `releaseCamera fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 释放会话
  async releaseSession() {
    await this.previewOutput.stop()
    await this.photoOutput.release()
    await this.captureSession.release()
    Logger.info(this.tag, `releaseSession success`)
  }

  // 获取相机管理器实例
  async getCameraManagerFn() {
    try {
      this.cameraManager = await camera.getCameraManager(globalThis.abilityContext)
      Logger.info(this.tag, `getCameraManager success: ` + JSON.stringify(this.cameraManager))
    } catch (err) {
      Logger.info(this.tag, `getCameraManagerFn fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 获取支持指定的相机设备对象
  async getSupportedCamerasFn() {
    try {
      this.cameras = await this.cameraManager.getSupportedCameras()
      Logger.info(this.tag, `getSupportedCameras success: ` + JSON.stringify(this.cameras))
      Logger.info(this.tag, `getSupportedCameras length success: ${this.cameras.length}`)
    } catch (err) {
      Logger.info(this.tag, `getSupportedCamerasFn fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 创建previewOutput输出对象
  async createPreviewOutputFn(previewProfilesObj, surfaceId) {
    try {
      Logger.info(this.tag, `createPreviewOutputFn previewProfilesObj success: ` + JSON.stringify(previewProfilesObj))
      this.previewOutput = await this.cameraManager.createPreviewOutput(previewProfilesObj, surfaceId.toString())
      Logger.info(this.tag, `createPreviewOutputFn success: ` + JSON.stringify(this.previewOutput))
    } catch (err) {
      Logger.info(this.tag, `createPreviewOutputFn fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 创建photoOutput输出对象
  async createPhotoOutputFn(photoProfileObj) {
    try {
      Logger.info(this.tag, `createPhotoOutputFn photoProfileObj success: ` + JSON.stringify(photoProfileObj))
      let mSurfaceId = await this.mReceiver.getReceivingSurfaceId()
      this.photoOutput = await this.cameraManager.createPhotoOutput(photoProfileObj, mSurfaceId)
      Logger.info(this.tag, `createPhotoOutputFn success: ` + JSON.stringify(this.photoOutput))
    } catch (err) {
      Logger.info(this.tag, `createPhotoOutputFn fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 创建cameraInput输出对象
  async createCameraInputFn(cameraDeviceIndex) {
    try {
      this.cameraInput = await this.cameraManager.createCameraInput(cameraDeviceIndex)
      Logger.info(this.tag, `createCameraInputFn success: ${this.cameraInput}`)
    } catch (err) {
      Logger.info(this.tag, `createCameraInputFn fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }

  // 打开相机
  async cameraInputOpenFn() {
    await this.cameraInput.open()
      .then((data) => {
        Logger.info(this.tag, `cameraInputOpenFn open success: ${data}`)
      })
      .catch((err) => {
        Logger.info(this.tag, `cameraInputOpenFn fail err: ${err}, message: ${err.message}, code: ${err.code}`)
      })
  }

  // 会话流程
  async sessionFlowFn() {
    try {
      // 创建captureSession实例
      this.captureSession = await this.cameraManager.createCaptureSession()
      // 开始配置会话
      await this.captureSession.beginConfig()
      // cameraInput加入会话
      await this.captureSession.addInput(this.cameraInput)
      // previewOutput加入会话
      await this.captureSession.addOutput(this.previewOutput)
      // photoOutput加入会话
      await this.captureSession.addOutput(this.photoOutput)
      // 提交配置会话
      await this.captureSession.commitConfig()
      // 开启会话
      await this.captureSession.start()
      Logger.info(this.tag, `sessionFlowFn success`)
    } catch (err) {
      Logger.info(this.tag, `sessionFlowFn fail err: ${err}, message: ${err.message}, code: ${err.code}`)
    }
  }
}

export default new CameraService()
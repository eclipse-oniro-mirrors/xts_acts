/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base'
import { GlobalContext } from '../comFile/utils/GlobalContext'
import camera from '@ohos.multimedia.camera';

const TAG: string = 'CameraService'

class CameraService {
  private cameraManager: camera.CameraManager | undefined = undefined
  private cameras: Array<camera.CameraDevice> | Array<camera.CameraDevice> = []
  private cameraInput: camera.CameraInput | undefined = undefined
  private previewOutput: camera.PreviewOutput | undefined = undefined
  private photoOutput: camera.PhotoOutput | undefined = undefined
  private session: camera.PhotoSession | undefined = undefined
  private handlePhotoAssetCb: (photoAsset: photoAccessHelper.PhotoAsset) => void = () => {
  }
  private curCameraDevice: camera.CameraDevice | undefined = undefined
  // 推荐拍照分辨率之一
  private photoProfileObj: camera.Profile = {
    format: 2000,
    size: {
      width: 1920,
      height: 1080
    }
  }
  // 推荐预览分辨率之一
  private previewProfileObj: camera.Profile = {
    format: 1003,
    size: {
      width: 1920,
      height: 1080
    }
  }
  private curSceneMode: camera.SceneMode = camera.SceneMode.NORMAL_PHOTO

  constructor() {
  }

  setSavePictureCallback(callback: (photoAsset: photoAccessHelper.PhotoAsset) => void): void {
    this.handlePhotoAssetCb = callback
  }

  setSceneMode(sceneMode: camera.SceneMode): void {
    this.curSceneMode = sceneMode
  }

  getSceneMode(): camera.SceneMode {
    return this.curSceneMode
  }

  getPreviewProfile(cameraOutputCapability: camera.CameraOutputCapability): camera.Profile | undefined {
    let previewProfiles = cameraOutputCapability.previewProfiles
    if (previewProfiles.length < 1) {
      return undefined
    }
    return previewProfiles[0]
  }

  getPhotoProfile(cameraOutputCapability: camera.CameraOutputCapability): camera.Profile | undefined {
    let photoProfiles = cameraOutputCapability.photoProfiles
    if (photoProfiles.length < 1) {
      return undefined
    }
    return photoProfiles[0]
  }

  isSupportedSceneMode(cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice): boolean {
    let sceneModes = cameraManager.getSupportedSceneModes(cameraDevice)
    if (sceneModes === undefined) {
      return false
    }
    let index = sceneModes.findIndex((sceneMode: camera.SceneMode) => {
      return sceneMode === this.curSceneMode
    })
    if (index === -1) {
      return false
    }
    return true
  }

  //初始化相机功能
  async initCamera(surfaceId: string, cameraDeviceIndex: number): Promise<void> {
    try {
      await this.releaseCamera()
      this.cameraManager = this.getCameraManagerFn()
      console.info('www data succeed' + 111)
      if (this.cameraManager === undefined) {
        return
      }
      //获取支持指定的相机设备对象
      this.cameras = this.getSupportedCamerasFn(this.cameraManager)
      if (this.cameras.length < 1 || this.cameras.length < cameraDeviceIndex + 1) {
        return
      }
      console.info('www data 2')
      this.curCameraDevice = this.cameras[cameraDeviceIndex]
      let isSupported = this.isSupportedSceneMode(this.cameraManager, this.curCameraDevice)
      if (!isSupported) {
        return
      }
      console.info('www data 3')
     let cameraOutputCapability=this.cameraManager.getSupportedOutputCapability(this.curCameraDevice,this.curSceneMode)
      let previewProfile = this.getPreviewProfile(cameraOutputCapability)
      if (previewProfile === undefined) {
        return
      }
      console.info('www data 4')
      this.previewProfileObj = previewProfile
      let photoProfile = this.getPhotoProfile(cameraOutputCapability)
      if (photoProfile === undefined) {
        return
      }
      console.info('www data 5')
      this.photoProfileObj = photoProfile
      //创建previewOutput输出对象
      this.previewOutput = this.createPreviewOutputFn(this.cameraManager, this.previewProfileObj, surfaceId)
      if (this.previewOutput === undefined) {
        return
      }
      console.info('www data 6')
      //监听预览事件
      this.previewOutputCallBack(this.previewOutput)
      //创建photoOutPut输出对象
      this.photoOutput = this.createPhotoOutputFn(this.cameraManager, this.photoProfileObj)
      if (this.photoOutput === undefined) {
        return
      }
      console.info('www data 7')
      //创建cameraInput输出对象
      this.cameraInput = this.createCameraInputFn(this.cameraManager, this.curCameraDevice)
      if (this.cameraInput === undefined) {
        return
      }
      console.info('www data 8')
      //打开相机
      let isOpenSuccess = await this.cameraInputOpenFn(this.cameraInput)
      if (!isOpenSuccess) {
        return
      }
      console.info('www data 9')
      //镜头状态回调
      this.onCameraStatusChange(this.cameraManager)
      //监听CameraInput的错误事件
      this.onCameraInputChange(this.cameraInput, this.curCameraDevice)
      console.info('www data 9.5')
      //会话流程
      await this.sessionFlowFn(this.cameraManager, this.cameraInput, this.previewOutput, this.photoOutput)
      console.info('www data 10')
    } catch (error) {
      console.info('www data3' + error)
      console.info('www data3' + error.message)
      let err = error as BusinessError
    }
  }

  //变焦
  setZoomRatioFn(zoomRatio: number): void {
    //获取支持的变焦范围
    try {
      let zoomRationRange = this.session?.getZoomRatioRange()
    } catch (error) {
      let err = error as BusinessError
    }
    try {
      this.session?.setZoomRatio(zoomRatio)
    } catch (error) {
      let err = error as BusinessError
    }
    try {
      let nowZoomRatio = this.session?.getZoomRatio()
    } catch (error) {
      let err = error as BusinessError
    }
  }

  //拍照
  async takepicture(): Promise<void> {
    let photoSettings: camera.PhotoCaptureSetting = {
      quality: camera.QualityLevel.QUALITY_LEVEL_HIGH,
      mirror: false
    }
    await this.photoOutput?.capture(photoSettings)
  }

  //释放会话及相关参数
  async releaseCamera(): Promise<void> {
    if (this.previewOutput) {
      try {
        await this.previewOutput.release()
      } catch (error) {
        let err = error as BusinessError
      } finally {
        this.previewOutput = undefined
      }
    }
    if(this.photoOutput){
      try {

      } catch (error) {
        let err = error as BusinessError;
      } finally {
        this.photoOutput = undefined;
      }
    }
    if (this.session) {
      try {
        await this.session.release()
      } catch (error) {
        let err = error as BusinessError
      } finally {
        this.session = undefined
      }
    }
    if (this.cameraInput) {
      try {
        await this.cameraInput.close()
      } catch (error) {
        let err = error as BusinessError
      } finally {
        this.cameraInput = undefined
      }
    }
    this.offCameraStatusChange()
  }

  //获取相机管理器实例
  getCameraManagerFn(): camera.CameraManager | undefined {
    if (this.cameraManager) {
      return this.cameraManager
    }
    let cameraManager: camera.CameraManager | undefined = undefined
    try {
      cameraManager = camera.getCameraManager(GlobalContext.get().getCameraSettingContext())
    } catch (error) {
      let err = error as BusinessError
    }
    return cameraManager
  }

  //获取支持指定的相机设备对象
  getSupportedCamerasFn(cameraManager: camera.CameraManager): Array<camera.CameraDevice> {
    let supportedCameras: camera.CameraDevice[] = []
    try {
      supportedCameras = cameraManager.getSupportedCameras()
    } catch (error) {
      let err = error as BusinessError
    }
    return supportedCameras
  }

  //创建previewOutput输出对象
  createPreviewOutputFn(cameraManager: camera.CameraManager, previewProfileObj: camera.Profile, surfaceId: string): 
  camera.PreviewOutput | undefined {
    let previewOutput: camera.PreviewOutput | undefined = undefined
    try {
      previewOutput = cameraManager.createPreviewOutput(previewProfileObj, surfaceId)
    } catch (error) {
      let err = error as BusinessError
    }
    return previewOutput
  }

  //创建photoOutput输出对象
  createPhotoOutputFn(cameraManager: camera.CameraManager, photoProfileObj: camera.Profile): 
  camera.PhotoOutput | undefined {
    let photoOutput: camera.PhotoOutput | undefined = undefined
    try {
      photoOutput = cameraManager.createPhotoOutput(photoProfileObj)
    } catch (error) {
      let err = error as BusinessError
    }
    return photoOutput
  }

  //创建cameraInput输出对象
  createCameraInputFn(cameraManager: camera.CameraManager, cameraDevice: camera.CameraDevice): 
  camera.CameraInput | undefined {
    let cameraInput: camera.CameraInput | undefined = undefined
    try {
      cameraInput = cameraManager.createCameraInput(cameraDevice)
    } catch (error) {
      let err = error as BusinessError
    }
    return cameraInput
  }

  //打开相机
  async cameraInputOpenFn(cameraInput: camera.CameraInput): Promise<boolean> {
    let isOpenSuccess = false
    try {
      await cameraInput.open()
      isOpenSuccess = true
    } catch (error) {
      let err = error as BusinessError
    }
    return isOpenSuccess
  }

  /* 会话流程 */
  async sessionFlowFn(cameraManger: camera.CameraManager, cameraInput: camera.CameraInput, 
  previewOutput: camera.PreviewOutput, photoOutput: camera.PhotoOutput): Promise<void> {
    try {
      // 创建captureSession实例
      this.session = cameraManger.createSession(this.curSceneMode) as camera.PhotoSession
      if (this.session === undefined) {
        return
      }
      // 监听拍照会话的错误事件
      this.onCaptureSessionErrorChange(this.session)
      // 开始配置会话
      this.session.beginConfig()
      // 把CameraInput加入会话
      this.session.addInput(cameraInput)
      // 把previewOutput加入会话
      this.session.addOutput(previewOutput)
      // 把photoOutput加入会话
      this.session.addOutput(photoOutput)
      // 拍照监听事件
      this.photoOutputCallBack(photoOutput)
      // 提交配置信息
      await this.session.commitConfig()
      // 开始会话工作
      await this.session.start()
    } catch (error) {
      let err = error as BusinessError
    }
  }

  // 监听拍照事件
  photoOutputCallBack(photoOutput: camera.PhotoOutput): void {
    try {
      // 监听拍照开始
      photoOutput.on('captureStartWithInfo', (err: BusinessError, captureStartInfo: camera.CaptureStartInfo): void => {
      })
      // 监听拍照帧输出捕获
      photoOutput.on('frameShutter', (err: BusinessError, frameShutterInfo: camera.FrameShutterInfo): void => {
      })
      // 监听拍照结束
      photoOutput.on('captureEnd', (err: BusinessError, captureEndInfo: camera.CaptureEndInfo): void => {
      })
      // 监听拍照异常
      photoOutput.on('error', (data: BusinessError): void => {
      })
    } catch (err) {
    }
  }

  // 监听预览事件
  previewOutputCallBack(previewOutput: camera.PreviewOutput): void {
    try {
      previewOutput.on('frameStart', (): void => {
      })
      previewOutput.on('frameEnd', (): void => {
      })
      previewOutput.on('error', (previewOutputError: BusinessError): void => {
      })
    } catch (err) {
    }
  }

  // 注册相机变化的回调函数
  registerCameraStatusChange(err: BusinessError, cameraStatusInfo: camera.CameraStatusInfo) {
  }

  // 监听相机状态变化
  onCameraStatusChange(cameraManager: camera.CameraManager): void {
    try {
      cameraManager.on('cameraStatus', this.registerCameraStatusChange)
    } catch (error) {

    }
  }

  // 停止监听相机状态变化
  offCameraStatusChange(): void {
    this.cameraManager?.off('cameraStatus', this.registerCameraStatusChange)
  }

  // 监听相机输入变化
  onCameraInputChange(cameraInput: camera.CameraInput, cameraDevice: camera.CameraDevice): void {
    try {
      cameraInput.on('error', cameraDevice, (cameraInputError: BusinessError): void => {
      })
    } catch (error) {
    }
  }

  // 监听捕获绘画错误变化
  onCaptureSessionErrorChange(session: camera.PhotoSession): void {
    try {
      session.on('error', (captureSessionError: BusinessError): void => {
      })
    } catch (error) {
    }
  }
}

export default new CameraService()